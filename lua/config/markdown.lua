local function handleMDCheckboxes(mode)
	local cur_line = vim.api.nvim_get_current_line()

	local cb_start = string.find(cur_line, "- %[[ xX/?-]%]")

	if cb_start then
		local new_char = cur_line:sub(cb_start + 3, cb_start + 3) == " " and "x" or " "
		vim.api.nvim_set_current_line(
			cur_line:sub(1, cb_start + 1) .. "[" .. new_char .. "]" .. cur_line:sub(cb_start + 5)
		)
	else
		local first_non_whitespace_pos = string.find(cur_line, "%S")

		if first_non_whitespace_pos == nil then
			vim.api.nvim_set_current_line("- [ ]")
			if mode == "n" then
				vim.api.nvim_feedkeys("V=A ", "n", false)
			end
		else
			vim.api.nvim_set_current_line(
				cur_line:sub(1, first_non_whitespace_pos - 1) .. "- [ ] " .. cur_line:sub(first_non_whitespace_pos)
			)
		end
	end
end
vim.keymap.set("n", "<C-c>", function()
	handleMDCheckboxes("n")
end)
vim.keymap.set("i", "<C-c>", function()
	handleMDCheckboxes("i")
end)
