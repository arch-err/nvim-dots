vim.api.nvim_create_user_command("K8sB", function()
	vim.api.nvim_feedkeys("gg", "n", false)
	vim.api.nvim_command("/metadata")
	vim.api.nvim_command("/  name:")
	vim.api.nvim_feedkeys('f:f l"ayiW', "n", false)
	vim.api.nvim_command('echo "' .. vim.fn.getreg("a") .. '"')
	vim.api.nvim_feedkeys(":w a.yaml", "n", false)
end, {
	desc = "Save the current k8s manifest as a file (with the same name as the manifest name)",
})

vim.api.nvim_create_user_command("Kaf", function()
	local filename = vim.fn.expand("%")
	local line = "#!CMD: kubectl apply -f " .. filename
	vim.api.nvim_buf_set_lines(0, 0, 0, false, { line })
end, {
	desc = "Add the line '#!CMD: kubectl apply -f <filename> to the top of the vcurrent file.'",
})

vim.api.nvim_create_user_command("WebDevStart", function()
	vim.opt.titlestring = "WebDev"
	require("live_server").start()
end, {
	desc = "WebDev Mode Start",
})
vim.api.nvim_create_user_command("WebDevStop", function()
	vim.opt.titlestring = 'NeoVim | %(%{expand("%:~:.:h")}%)/%t'
	require("live_server").stop()
end, {
	desc = "WebDev Mode Start",
})

vim.api.nvim_create_user_command("GoGitHub", function()
	local line = vim.api.nvim_get_current_line()

	-- Pattern to find potential GitHub username/repo patterns
	--   - Word characters for username/repo name
	--   - Separated by a forward slash
	--   - Optionally preceded by 'github.com/' or other common prefixes

	local stripped = vim.fn.system("echo '" .. line .. "' | sed 's|.*\\([\\w-]+/[\\w-]+\\).*|\\1/'")

	local github_url = "https://github.com/" .. stripped
	vim.fn.system("xdg-open " .. github_url)
end, {
	desc = "Find a GitHub link on the current line and open it in my browser",
})
vim.keymap.set("n", "ggh", "<cmd>GoGitHub<CR>", { noremap = true, silent = true })

vim.api.nvim_create_user_command("Zen", function()
	-- LineNums
	if vim.opt.nu then
		vim.opt.nu = false
	else
		vim.opt.nu = true
	end
	-- vim.opt.nu = true
end, {
	desc = "Toggle zen-mode (remove most of the UI in nvim)",
})

-- -- Template Loader
-- ---------------------
--
local telescope = require("telescope.builtin")

-- Function to load a template file and overwrite the current buffer
local function load_template()
	-- Specify the directory containing your template files
	local template_dir = vim.fn.expand("~/.local/src/arshell/templates")

	-- Use Telescope to select a file from the template directory
	telescope.find_files({
		prompt_title = "Select a Template",
		cwd = template_dir,
		attach_mappings = function(prompt_bufnr, map)
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			-- Replace the default action (Enter) with custom behavior
			actions.select_default:replace(function()
				-- Get the selected file's path
				local selected_file = action_state.get_selected_entry().path

				-- Read the contents of the selected file
				local lines = vim.fn.readfile(selected_file)

				-- Close the Telescope prompt
				actions.close(prompt_bufnr)

				-- Detect the filetype of the selected file and set it for the current buffer
				local filetype = vim.filetype.match({ filename = selected_file })
				if filetype then
					print(filetype)
					vim.bo.filetype = filetype
				end

				-- Overwrite the current buffer with the file's contents
				vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
			end)

			return true
		end,
	})
end

-- Create a Vim command to invoke the function
vim.api.nvim_create_user_command("LoadTemplate", load_template, {})
