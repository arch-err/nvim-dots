require("config.lazy")
-- require("gopher").setup()
--
require("config.set")
require("config.remap")
require("config.commands")
require("config.markdown")

vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "NONE", fg = "#888888" })
vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "NONE", fg = "#888888" })
vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "NONE", fg = "#888888" })
vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "NONE", fg = "#888888" })
vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "NONE", fg = "#888888" })
vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "NONE", fg = "#888888" })

vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#111111" })
vim.api.nvim_set_hl(0, "RenderMarkdownQuote", { bg = "#111111" })
