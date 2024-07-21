local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"gopls",
		"helm_ls",
		"lua_ls",
		"rust_analyzer",
		"tsserver",
		"pylsp",
		"perlnavigator",
		"yamlls",
		"cssls",
		"dockerls",
		"emmet_language_server",
		"bashls",
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<c-i>d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<c-i>D", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<c-i>t", "<cmd>Telescope diagnostics<cr>", opts)
	vim.keymap.set("n", "<c-i>c", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<c-i>r", vim.lsp.buf.rename, opts)
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

require("ufo").setup()
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "luasnip" },
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
		["<Enter>"] = cmp.mapping.confirm({ select = true }),
		-- ['<C-Space>'] = cmp.mapping.complete(),
	}),
})

-- ----------
--   LSPs
-- ----------

local server_mappings = {
	dockerls = "dockerfile",
	cssls = "css",
	yamlls = "yaml",
	perlnavigator = "perl",
	emmet_language_server = "html",
	bashls = "sh",
	pylsp = "python",
}
for server_name, filetype in pairs(server_mappings) do
	lspconfig[server_name].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { filetype },
	})
end

lspconfig.gopls.setup({
	-- cmd = {"gopls"},
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})
vim.keymap.set("n", "gos", ":GoTagAdd ")
vim.keymap.set("n", "goS", ":GoTagRm ")
vim.keymap.set("n", "got", function()
	require("neotest").run.run()
end)

lspconfig.lua_ls.setup({
	settings = {
		Lua = { diagnostics = { globals = { "vim" } } },
	},
})

lspconfig.helm_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "helm" },
	root_dir = util.root_pattern("values.yaml", "Values.yaml", ".git"),
})

-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
