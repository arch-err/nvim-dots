require('dap-go').setup()

vim.keymap.set("n", "<leader>db", '<cmd>DapToggleBreakpoint<cr>')
vim.keymap.set("n", "<leader>ds", function ()
	local widgets = require('dap.ui.widgets');
	local sidebar = widgets.sidebar(widgets.scopes);
	sidebar.open();
end)
