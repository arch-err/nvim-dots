return {
	"MeanderingProgrammer/render-markdown.nvim",
	enabled = true,
	dependencies = {
		"echasnovski/mini.nvim"
	},
	config = function()
		require("render-markdown").setup({
			heading = {
				enabled = true,
				sign = true,
				position = 'overlay',
				icons = { '󰲡 ', '󰲣 ', '󰲥 ', '[BAD DOCUMENT STRUCTURE!!] ', '[STOP IT!!] ', '[WHAT THE HELL IS EVEN THAT?! H6!!?] ' },
				signs = { '󰫎 ' },
				width = 'full',
				left_margin = 0,
				left_pad = 0,
				right_pad = 0,
				min_width = 0,
				border = false,
				border_virtual = false,
				border_prefix = false,
				above = '▄',
				below = '▀',
				backgrounds = {
					'RenderMarkdownH1Bg',
					'RenderMarkdownH2Bg',
					'RenderMarkdownH3Bg',
					'RenderMarkdownH4Bg',
					'RenderMarkdownH5Bg',
					'RenderMarkdownH6Bg',
				},
				foregrounds = {
					'RenderMarkdownH1',
					'RenderMarkdownH2',
					'RenderMarkdownH3',
					'RenderMarkdownH4',
					'RenderMarkdownH5',
					'RenderMarkdownH6',
				},
			},
		})
	end,
}
