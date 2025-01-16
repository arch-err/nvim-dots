return {
	"mfussenegger/nvim-lint",
	enabled = true,
	config = function()
	require("lint").linters_by_ft = {
		go = { "golangci-lint" },
		yaml = { "yamllint" },
	}
	end
}
