-- vim.opt.guicursor = ""

-- vim.opt.title = true
vim.opt.titlestring = 'VimSlides'

vim.opt.nu = false
vim.opt.relativenumber = false
vim.diagnostic.disable()
vim.opt.signcolumn = "no"
vim.opt.ruler = false
vim.opt.laststatus = 0
vim.wo.fillchars='eob: '

-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true

-- vim.opt.smartindent = true

-- vim.opt.wrap = true
-- vim.opt.showcmd = false

-- vim.opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
-- vim.opt.undofile = true

-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- vim.opt.hlsearch = false
-- vim.opt.incsearch = true

-- vim.opt.termguicolors = true

-- vim.opt.scrolloff = 8
-- -- vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")

-- vim.opt.updatetime = 50
-- -- vim.opt.colorcolumn = "80"

-- vim.opt.splitright = true
-- vim.opt.splitbelow = true

-- vim.opt.inccommand = 'split'
vim.opt.cursorline = false


-- -- Save view (folds)
-- vim.api.nvim_create_autocmd({"BufWinLeave"}, {
--   pattern = {"*.*"},
--   desc = "save view (folds), when closing file",
--   command = "mkview",
-- })
-- vim.api.nvim_create_autocmd({"BufWinEnter"}, {
--   pattern = {"*.*"},
--   desc = "load view (folds), when opening file",
--   command = "silent! loadview"
-- })

-- -- Slides
-- vim.api.nvim_create_autocmd({"BufWinEnter"}, {
--   pattern = {"*.vs"},
--   callback = function()
--     require("vimslides.lua")
--   end,
-- })

-- vim.o.clipboard = 'unnamedplus'
-- vim.o.mouse = 'a'

-- vim.o.completeopt = 'menuone,noselect'


-- -- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- -- [[ Highlight on yank ]]
-- -- See `:help vim.highlight.on_yank()`
-- local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   callback = function()
--     vim.highlight.on_yank()
--   end,
--   group = highlight_group,
--   pattern = '*',
-- })
