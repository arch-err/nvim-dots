function Transparency(color)
	color = color or "onedarker"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#00cc00" })

end

Transparency()
