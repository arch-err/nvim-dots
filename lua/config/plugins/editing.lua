return {
	"jiangmiao/auto-pairs",
	"tpope/vim-surround",
	{
		"mbbill/undotree",
		enabled = true,
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
	{
		"lucidph3nx/nvim-sops",
		enabled = true,
		event = { "BufEnter" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"ethanholz/nvim-lastplace",
		enabled = true,
		config = function()
			require("nvim-lastplace").setup()
		end,
	},
	{
		"cappyzawa/trim.nvim",
		enabled = true,
		config = function()
			require("trim").setup()
		end,
	},
	{
		"chrisgrieser/nvim-various-textobjs",
		enabled = true,
		config = function()
			require("various-textobjs").setup()
		end,
	},
	{
		"Pocco81/auto-save.nvim",
		enabled = true,
		config = function()
			require("auto-save").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = true,
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"monaqa/dial.nvim",
		enabled = true,
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.constant.new({
						elements = { "and", "or" },
						word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
						cyclic = true, -- "or" is incremented into "and".
					}),
					augend.constant.new({
						elements = { "true", "false" },
						word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
						cyclic = true, -- "or" is incremented into "and".
					}),
					augend.constant.new({
						elements = { "True", "False" },
						word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
						cyclic = true, -- "or" is incremented into "and".
					}),
					augend.constant.new({
						elements = { "&&", "||" },
						word = false,
						cyclic = true,
					}),
					augend.integer.new({
						radix = 16,
						prefix = "0x",
						natural = true,
						case = "upper",
					}),
					augend.integer.new({
						radix = 16,
						prefix = "#",
						natural = true,
						case = "upper",
					}),
					augend.integer.new({
						radix = 10,
						natural = false,
					}),
					augend.date.new({
						pattern = "%Y-%m-%d",
						default_kind = "day",
						only_valid = true, -- if true, it does not match dates which does not exist, such as 2022/05/32
						word = false, -- if true, it only matches dates with word boundary
					}),
					augend.date.new({
						pattern = "%Y/%m/%d",
						default_kind = "day",
						only_valid = true, -- if true, it does not match dates which does not exist, such as 2022/05/32
						word = false, -- if true, it only matches dates with word boundary
					}),
				},
			})
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
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		enabled = true,
		dependencies = {
			"kevinhwang91/nvim-ufo",
			"kevinhwang91/promise-async",
		},
		config = function()
			require("ufo").setup()
		end,
	},
}
