local colors = {
	blue   = '#80a0ff',
	cyan   = '#79dac8',
	black  = '#080808',
	white  = '#c6c6c6',
	red    = '#ff5189',
	violet = '#d183e8',
	grey   = '#111111',
	dark_gray   = '#090909',
	active_green   = '#008800',
	active_cyan   = '#008888',
	active_red   = '#aa0000',
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.active_green, bg = colors.dark_gray },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white },
	},
	winbar = {
		a = { fg = colors.active_red, bg = colors.dark_gray },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white },
	},

	insert  = { a = { fg = colors.active_red, bg = colors.dark_gray } },
	visual = { a = { fg = colors.active_cyan, bg = colors.dark_gray } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white },
	},
}

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = bubbles_theme,
		component_separators = '',
		section_separators = { left = '', right = '' },
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
		}
	},
	sections = {
		lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
		lualine_b = { 'filename' },
		lualine_c = {'branch', 'diff', 'diagnostics'},
		-- lualine_c = {
		-- 	'%=', --[[ add your center compoentnts here in place of this comment ]]
		-- },
		lualine_x = {},
		lualine_y = { 'filetype', 'filesize' },
		lualine_z = {
			{ 'progress', separator = { right = '' }, left_padding = 2 },
		},
	},

	inactive_sections = {
		lualine_a = { 'filename' },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { 'location' },
	},

	winbar = {
		lualine_a = { {
			'buffers',
			separator = { left = '', right = '' },
			right_padding = 4,
			left_padding = 4,
			symbols = {
				modified = ' ●',      -- Text to show when the buffer is modified
				alternate_file = '', -- Text to show to identify the alternate file
				directory =  '',     -- Text to show when the buffer is a directory
			},
		} },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	inactive_winbar = {},
	extensions = {}
}