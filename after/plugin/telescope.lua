local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader><C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>/', function()
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end)

require("telescope").load_extension("emoji")

require("telescope").setup {
	defaults = {
		layout_strategy = "horizontal",
	},
	pickers = {
		find_files = {
			hidden = true
		},
	}
}
