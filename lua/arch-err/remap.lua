vim.g.mapleader = " "

vim.keymap.set("n", "<leader><leader>", '0/<++><CR>"_ca<')
vim.keymap.set("n", "Q", "@q")
vim.keymap.set("n", "U", "<C-r>")

vim.keymap.set("n", "<C-'>", '"vyiw:%s/v//g<Left><Left>')
vim.keymap.set("v", "<C-'>", '"vy:%s/v//g<Left><Left>')
vim.keymap.set("n", "<leader><C-'>", '"vyiw:s/v//g<Left><Left>')
vim.keymap.set("v", "<leader><C-'>", '"vy:s/v//g<Left><Left>')

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

vim.keymap.set("n", "<C-o>", "<C-o>zz", { noremap = true, silent = false })
vim.keymap.set("n", "gd", "gdzz", { noremap = true, silent = false })
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
vim.keymap.set("n", "<leader>n", ":enew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", ":w ")
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>z", "zfip")
vim.keymap.set("n", "<leader>s", "mpvip:sort<CR>`p", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>a", "za")

vim.keymap.set("v", "<C-s>", ":sort<CR>`p", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>h", "<cmd>wincmd h<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", "<cmd>wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<leader>k", "<cmd>wincmd k<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>l", "<cmd>wincmd l<CR>", { noremap = true, silent = true })

vim.keymap.set(
	"n",
	"<C-y>",
	":FloatermNew! --title=Yazi --wintype=float --width=0.92 --height=0.95 ya && exit<CR>",
	{ noremap = true, silent = true }
)

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
