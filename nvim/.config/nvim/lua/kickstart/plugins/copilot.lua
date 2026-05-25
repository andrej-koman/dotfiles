-- GitHub Copilot integration via copilot.lua + copilot-cmp (nvim-cmp)
-- Authenticate once with :Copilot auth (requires a Copilot subscription)

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				-- Use nvim-cmp for suggestions instead of copilot.lua's inline UI
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
