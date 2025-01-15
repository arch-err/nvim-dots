vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"arch-err/venomous.nvim",
		config = function()
			vim.cmd("colorscheme venomous")
		end,
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
	})

	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",

			"nvim-neotest/neotest-go",
		},
	})

	use("MunifTanjim/nui.nvim")
	use("mfussenegger/nvim-lint")
	use("Pocco81/auto-save.nvim")
	use("cappyzawa/trim.nvim")
	use("chrisgrieser/nvim-puppeteer")
	use("chrisgrieser/nvim-various-textobjs")
	use("dstein64/nvim-scrollview")
	use("ethanholz/nvim-lastplace")
	use("f-person/git-blame.nvim")
	use("folke/noice.nvim")
	use("jiangmiao/auto-pairs")
	use("karb94/neoscroll.nvim")
	use("kiyoon/telescope-insert-path.nvim")
	use("lewis6991/gitsigns.nvim")
	use("luckasRanarison/tree-sitter-hypr")
	use("lukas-reineke/indent-blankline.nvim")
	use("mbbill/undotree")
	use("monaqa/dial.nvim")
	use("nvim-lualine/lualine.nvim")
	use("nvim-treesitter/playground")
	use("stevearc/conform.nvim")
	use("tamton-aquib/duck.nvim")
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("tribela/vim-transparent")
	use("ThePrimeagen/htmx-lsp")
	use("xiyaowong/telescope-emoji.nvim")
	use("mfussenegger/nvim-dap")
	use("arakkkkk/kanban.nvim")
	use("voldikss/vim-floaterm")
	use({
		"olexsmir/gopher.nvim",
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	})
	use({ "leoluz/nvim-dap-go", requires = "mfussenegger/nvim-dap" })
	use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "kdheepak/lazygit.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use({
		"aurum77/live-server.nvim",
		run = function()
			require("live_server.util").install()
		end,
		cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	})
	use({
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("typescript-tools").setup({})
		end,
	})
	use({
		"MeanderingProgrammer/render-markdown.nvim",
		after = { "nvim-treesitter" },
		requires = { "echasnovski/mini.nvim", opt = true }, -- if you use the mini.nvim suite
		-- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
		-- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
		config = function()
			require("render-markdown").setup({})
		end,
	})
end)
