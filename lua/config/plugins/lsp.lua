return {
	{
		"neovim/nvim-lspconfig",
		enabled = true,
		vim.apu,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = { diagnostics = { globals = { "vim" } } },
					},
				},
				gopls = {},
				helm_ls = {},
				rust_analyzer = {},
				pylsp = {},
				perlnavigator = {},
				yamlls = {},
				cssls = {},
				dockerls = {},
				emmet_language_server = {},
				bashls = {},
				eslint = {},
				tailwindcss = {},
				-- <++> = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			-- local util = require("lspconfig/util")

			local capabilities = {
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
				},
			}

			local on_attach = function(client, bufnr)
				local oa_opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, oa_opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, oa_opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, oa_opts)
				vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, oa_opts)
				vim.keymap.set("n", "<c-i>d", vim.diagnostic.goto_next, oa_opts)
				vim.keymap.set("n", "<c-i>D", vim.diagnostic.goto_prev, oa_opts)
				vim.keymap.set("n", "<c-i>t", "<cmd>Telescope diagnostics<cr>", oa_opts)
				vim.keymap.set("n", "<c-i>c", vim.lsp.buf.code_action, oa_opts)
				vim.keymap.set("n", "<c-i>r", vim.lsp.buf.rename, oa_opts)
				--	 vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
				--	 vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
				--	 vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
				--	 vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
				--	 vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
				--	 vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
				--	 vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
				--	 vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
				--	 vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
				--	 vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
				if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
					vim.diagnostic.disable()
				end
			end

			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
				config.on_attach = on_attach
				lspconfig[server].setup(config)
			end

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(opts.servers),
			})
		end,
	},
	{
		"zeioth/garbage-day.nvim",
		enabled = true,
		dependencies = "neovim/nvim-lspconfig",
		-- event = "VeryLazy",
		opts = {
			grace_period = 300,
		},
	},
}
