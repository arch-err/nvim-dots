vim.api.nvim_create_user_command("K8sB", function()
	vim.api.nvim_command("/metadata")
	vim.api.nvim_command("/  name:")
	vim.api.nvim_feedkeys('f:f l"ayiW', "n", false)
	vim.api.nvim_command('echo "' .. vim.fn.getreg("a") .. '"')
	vim.api.nvim_feedkeys(":w a.yaml", "n", false)
end, {
	desc = "Save the current k8s manifest as a file (with the same name as the manifest name)",
})
