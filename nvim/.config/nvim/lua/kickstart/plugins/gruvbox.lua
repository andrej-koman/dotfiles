-- Gruvbox
return {
{
	"ellisonleao/gruvbox.nvim",
	name = "gruvbox",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	config = function()
		require("gruvbox").setup({
			italic = {
				strings = false,
				operators = false,
				folds = false,
				comments = false,
				emphasis = false,
			},
			contrast = "hard",
		})
	end,
	init = function()
		vim.cmd.colorscheme("gruvbox")

		-- You can configure highlights by doing something like:
		vim.cmd.hi("Comment gui=none")
	end,
},
}
