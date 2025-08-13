vim.opt.number = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.swapfile = false
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>r", ":update<CR>:so<CR>")


vim.pack.add({
		{src = "https://github.com/arch-err/ibad.nvim"},
})

vim.cmd("colorscheme ibad")
vim.api.nvim_set_hl(0, "CursorLine", {bg = "NONE"})
vim.api.nvim_set_hl(0, "Normal", {bg = "NONE"})
