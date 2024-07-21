require("lualine").setup({
	options = {
		icons_enabled = true,
		component_separators = "",
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 100,
		},
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
			{
				require("noice").api.statusline.mode.get,
				cond = require("noice").api.statusline.mode.has,
				color = { fg = "#008888" },
			},
		},
		lualine_b = { "filename" },
		lualine_c = { "branch", "diff", "diagnostics" },
		-- lualine_c = {
		-- 	'%=', --[[ add your center compoentnts here in place of this comment ]]
		-- },
		lualine_x = {},
		lualine_y = { "filetype", "filesize" },
		lualine_z = {
			{ "progress", separator = { right = "" }, left_padding = 2 },
		},
	},

	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},

	winbar = {
		lualine_a = {
			{
				"buffers",
				separator = { left = "", right = "" },
				right_padding = 4,
				left_padding = 4,
				symbols = {
					modified = " ●", -- Text to show when the buffer is modified
					alternate_file = "", -- Text to show to identify the alternate file
					directory = "", -- Text to show when the buffer is a directory
				},
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_winbar = {},
	extensions = {},
})
