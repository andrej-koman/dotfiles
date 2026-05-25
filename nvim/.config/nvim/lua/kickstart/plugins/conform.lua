-- Conform
return {
{ -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			if vim.bo[bufnr].filetype == "go" then
				return { timeout_ms = 1000, lsp_format = "fallback" }
			end
			return nil
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			html = { "prettire" },
			css = { "stylelint" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			go = { "goimports", "gofumpt" },
		},
	},
},
}
