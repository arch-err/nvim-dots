require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "javascript", "bash", "python", "rust", "go", "c", "lua", "vim", "vimdoc", "query", "helm", "yaml", "php", "java", "dockerfile" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
	enable = true,
	keymaps = {
		init_selection = '<c-space>',
		node_incremental = '<c-space>',
		-- scope_incremental = '<c-space>',
		node_decremental = '<c-enter>',
	}
  }
}

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.hypr = {
--   install_info = {
--     url = "https://github.com/luckasRanarison/tree-sitter-hypr",
--     files = { "src/parser.c" },
--     branch = "master",
--   },
--   filetype = "hypr",
-- }

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.gotmpl = {
  install_info = {
    url = "https://github.com/ngalaiko/tree-sitter-go-template",
    files = {"src/parser.c"},
  },
  filetype = "gotmpl",
  used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "yaml"},
}
