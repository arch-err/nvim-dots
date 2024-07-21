vim.g.mapleader = " "

vim.keymap.set("n", "<leader><leader>", '0/<++><CR>"_ca<')
vim.keymap.set("n", "Q", "@q")
vim.keymap.set("n", "U", "<C-r>")

vim.keymap.set("n", "<C-'>", '"vyiw:%s/v//g<Left><Left>')
vim.keymap.set("v", "<C-'>", '"vy:%s/v//g<Left><Left>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "#!", "ggO#!/usr/bin/env ")
vim.keymap.set("n", "<leader>b", 'ciW.<ESC>:read !echo " | base64 -d<CR>kJdhx')
vim.keymap.set("n", "<leader>B", 'ciW.<ESC>:read !echo " | base64 <CR>kJdhx')
vim.keymap.set("v", "<leader>b", 'c.<ESC>:read !echo " | base64 -d<CR>kJdhx')
vim.keymap.set("v", "<leader>B", 'c.<ESC>:read !echo " | base64 <CR>kJdhx')

vim.keymap.set("i", "<", "<><Left>")
vim.keymap.set("i", ":D", "<esc>:Telescope emoji")
vim.keymap.set("i", "++<leader>", "<++>")

vim.keymap.set("n", "ygc", "Vgc")
vim.keymap.set("n", "H", "_")
vim.keymap.set("n", "L", "$")
vim.keymap.set(
	"n",
	"<leader>bu",
	"<cmd>GitBlameOpenFileURL<cr><cmd>!hyprctl dispatch focusworkspaceoncurrentmonitor 10<cr>",
	{ noremap = true, silent = true }
)

vim.keymap.set("n", "<leader><Tab>", "<cmd>retab!<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>p", '<cmd>lua require("duck").hatch("", 3)<CR>')

---

vim.keymap.set("n", "<C-r>", ':!vimrunner "%:p" "%:p:h" & disown<CR><CR>', { noremap = true, silent = false })
vim.keymap.set("n", "<C-p>", ':!preview "%:p" "%:p:h" & disown<CR><CR>', { noremap = true, silent = false })
vim.keymap.set("n", "<C-h>", ":bp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", ":enew<CR>:Telescope find_files hidden=true no_ignore=true<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", ":bn<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", ":enew<CR>, { noremap = true}")
vim.keymap.set("n", "<C-w>", ":w ")
vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-z>", "zfip")
vim.keymap.set("n", "<C-s>", "mpvip:sort<CR>`p", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>r", ":!vimrunner <C-r>% & disown<CR><CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":bp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", ":enew<CR>:Telescope find_files hidden=true no_ignore=true<CR>", { silent = true })
vim.keymap.set("n", "<leader>k", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>l", ":bn<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>n", ":enew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", ":w ")
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>z", "zfip")
vim.keymap.set("n", "<leader>s", "mpvip:sort<CR>`p", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>a", "za")

vim.keymap.set("v", "<C-s>", ":sort<CR>`p", { noremap = true, silent = true })
