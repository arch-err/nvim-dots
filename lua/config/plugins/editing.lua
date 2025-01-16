return {
	"jiangmiao/auto-pairs",
	"tpope/vim-surround",
	{
		"mbbill/undotree",
		enabled = true,
		config = function ()
			vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
		end
	},
	{
		"ethanholz/nvim-lastplace",
		enabled = true,
		config = require("nvim-lastplace").setup()
	},
	{
		"cappyzawa/trim.nvim",
		enabled = true,
		config = require("trim").setup()
	},
	{
		"chrisgrieser/nvim-various-textobjs",
		enabled = true,
		config = require("various-textobjs").setup({ useDefaultKeymaps = true })
	},
	{
		"Pocco81/auto-save.nvim",
		enabled = true,
		config = require("auto-save").setup()
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = true,
		config = require("ibl").setup()
	},
	{
		"monaqa/dial.nvim",
		enabled = true,
		config = function ()
			vim.keymap.set("n", "<C-a>", function()
				require("dial.map").manipulate("increment", "normal")
			end)
			vim.keymap.set("n", "<C-x>", function()
				require("dial.map").manipulate("decrement", "normal")
			end)
			vim.keymap.set("n", "g<C-a>", function()
				require("dial.map").manipulate("increment", "gnormal")
			end)
			vim.keymap.set("n", "g<C-x>", function()
				require("dial.map").manipulate("decrement", "gnormal")
			end)
			vim.keymap.set("v", "<C-a>", function()
				require("dial.map").manipulate("increment", "visual")
			end)
			vim.keymap.set("v", "<C-x>", function()
				require("dial.map").manipulate("decrement", "visual")
			end)
			vim.keymap.set("v", "g<C-a>", function()
				require("dial.map").manipulate("increment", "gvisual")
			end)
			vim.keymap.set("v", "g<C-x>", function()
				require("dial.map").manipulate("decrement", "gvisual")
			end)

			local augend = require("dial.augend")
			require("dial.config").augends:register_group{
				default = {
					augend.constant.new{
						elements = {"and", "or"},
						word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
						cyclic = true,  -- "or" is incremented into "and".
					},
					augend.constant.new{
						elements = {"true", "false"},
						word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
						cyclic = true,  -- "or" is incremented into "and".
					},
					augend.constant.new{
						elements = {"True", "False"},
						word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
						cyclic = true,  -- "or" is incremented into "and".
					},
					augend.constant.new{
						elements = {"&&", "||"},
						word = false,
						cyclic = true,
					},
				},
			}
		end
	}
}
