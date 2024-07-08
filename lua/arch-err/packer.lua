vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use ({ "lunarvim/Onedarker.nvim",
		config = function()
			vim.cmd("colorscheme onedarker")
		end
	})

	use { 'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

	use 'luckasRanarison/tree-sitter-hypr'
	use 'MunifTanjim/nui.nvim'
	use 'Pocco81/auto-save.nvim'
	use 'cappyzawa/trim.nvim'
	use 'chrisgrieser/nvim-puppeteer'
	use 'chrisgrieser/nvim-various-textobjs'
	use 'dstein64/nvim-scrollview'
	use 'ethanholz/nvim-lastplace'
	use 'folke/noice.nvim'
	use 'jiangmiao/auto-pairs'
	use 'karb94/neoscroll.nvim'
	use 'kiyoon/telescope-insert-path.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'mbbill/undotree'
	use 'monaqa/dial.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'nvim-treesitter/playground'
	use 'stevearc/conform.nvim'
	use 'tamton-aquib/duck.nvim'
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'
	use 'tribela/vim-transparent'
	use 'xiyaowong/telescope-emoji.nvim'
	use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
	use {"kdheepak/lazygit.nvim", requires = "nvim-lua/plenary.nvim"}
	use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
	use {'nvim-treesitter/nvim-treesitter',  run = ':TSUpdate'}

end)
