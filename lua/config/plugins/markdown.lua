return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = true,
		dependencies = {
			"echasnovski/mini.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("render-markdown").setup({
				heading = {
					enabled = true,
					sign = true,
					position = "overlay",
					icons = {
						"   ",
						"    ",
						"    ",
						"[BAD DOCUMENT STRUCTURE!!] ",
						"[STOP IT!!] ",
						"[WHAT THE HELL IS EVEN THAT?! H6!!?] ",
					},
					-- signs = { "󰫎 " },
					signs = { "" },
					width = "full",
					left_margin = 0,
					left_pad = 0,
					right_pad = 0,
					min_width = 0,
					border = false,
					border_virtual = false,
					border_prefix = false,
					above = "▄",
					below = "▀",
					backgrounds = {
						"RenderMarkdownH1Bg",
						"RenderMarkdownH2Bg",
						"RenderMarkdownH3Bg",
						"RenderMarkdownH4Bg",
						"RenderMarkdownH5Bg",
						"RenderMarkdownH6Bg",
					},
					foregrounds = {
						"RenderMarkdownH1",
						"RenderMarkdownH2",
						"RenderMarkdownH3",
						"RenderMarkdownH4",
						"RenderMarkdownH5",
						"RenderMarkdownH6",
					},
				},
				paragraph = {
					-- Turn on / off paragraph rendering
					enabled = true,
					-- Additional modes to render paragraphs
					render_modes = false,
					-- Amount of margin to add to the left of paragraphs
					-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
					left_margin = 0,
					-- Minimum width to use for paragraphs
					min_width = 0,
				},
				quote = {
					enabled = true,
					-- Additional modes to render quotes
					render_modes = false,
					-- Replaces '>' of 'block_quote'
					icon = "▋",
					-- Whether to repeat icon on wrapped lines. Requires neovim >= 0.10. This will obscure text if
					-- not configured correctly with :h 'showbreak', :h 'breakindent' and :h 'breakindentopt'. A
					-- combination of these that is likely to work is showbreak = '  ' (2 spaces), breakindent = true,
					-- breakindentopt = '' (empty string). These values are not validated by this plugin. If you want
					-- to avoid adding these to your main configuration then set them in win_options for this plugin.
					repeat_linebreak = false,
					-- Highlight for the quote icon
					highlight = "RenderMarkdownQuote",
				},

				link = {
					enabled = true,
					render_modes = false,
					footnote = {
						enabled = true,
						superscript = true,
						prefix = "",
						suffix = "",
					},
					image = "",
					email = "󰀓 ",
					hyperlink = "󰌹 ",
					highlight = "RenderMarkdownLink",
					wiki = {
						icon = "󱗖 ",
						body = function()
							return nil
						end,
						highlight = "RenderMarkdownWikiLink",
					},
					custom = {
						web = { pattern = "^http", icon = "󰖟 " },
						discord = { pattern = "discord%.com", icon = "󰙯 " },
						github = { pattern = "github%.com", icon = "󰊤 " },
						gitlab = { pattern = "gitlab%.com", icon = "󰮠 " },
						google = { pattern = "google%.com", icon = "󰊭 " },
						neovim = { pattern = "neovim%.io", icon = " " },
						reddit = { pattern = "reddit%.com", icon = "󰑍 " },
						stackoverflow = { pattern = "stackoverflow%.com", icon = "󰓌 " },
						wikipedia = { pattern = "wikipedia%.org", icon = "󰖬 " },
						youtube = { pattern = "youtube%.com", icon = "󰗃 " },
					},
				},

				code = {
					enabled = true,
					-- Additional modes to render code blocks
					render_modes = true,
					-- Turn on / off any sign column related rendering
					sign = true,
					-- Determines how code blocks & inline code are rendered:
					--  none:     disables all rendering
					--  normal:   adds highlight group to code blocks & inline code, adds padding to code blocks
					--  language: adds language icon to sign column if enabled and icon + name above code blocks
					--  full:     normal + language
					style = "normal",
					-- Determines where language icon is rendered:
					--  right: right side of code block
					--  left:  left side of code block
					position = "left",
					-- Amount of padding to add around the language
					-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
					language_pad = 0,
					-- Whether to include the language name next to the icon
					language_name = true,
					-- A list of language names for which background highlighting will be disabled
					-- Likely because that language has background highlights itself
					-- Or a boolean to make behavior apply to all languages
					-- Borders above & below blocks will continue to be rendered
					disable_background = { "diff" },
					-- Width of the code block background:
					--  block: width of the code block
					--  full:  full width of the window
					width = "full",
					-- Amount of margin to add to the left of code blocks
					-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
					-- Margin available space is computed after accounting for padding
					left_margin = 0,
					-- Amount of padding to add to the left of code blocks
					-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
					left_pad = 1,
					-- Amount of padding to add to the right of code blocks when width is 'block'
					-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
					right_pad = 0,
					-- Minimum width to use for code blocks when width is 'block'
					min_width = 0,
					-- Determines how the top / bottom of code block are rendered:
					--  none:  do not render a border
					--  thick: use the same highlight as the code body
					--  thin:  when lines are empty overlay the above & below icons
					border = "thin",
					-- Used above code blocks for thin border
					above = "▄",
					-- Used below code blocks for thin border
					below = "▀",
					-- Highlight for code blocks
					highlight = "RenderMarkdownCode",
					-- Highlight for language, overrides icon provider value
					highlight_language = nil,
					-- Padding to add to the left & right of inline code
					inline_pad = 0,
					-- Highlight for inline code
					highlight_inline = "RenderMarkdownCodeInline",
				},
			})
		end,
	},
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {
			default = {
				drag_and_drop = {
					enabled = true,
					insert_mode = true,
				},

				dir_path = "./assets",
				copy_images = true,
				download_images = true,
			},
		},
	},
}
