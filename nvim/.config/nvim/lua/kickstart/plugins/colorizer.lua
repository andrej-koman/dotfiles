-- Colorizer
return {
{
	-- 1) repo
	"norcalli/nvim-colorizer.lua",

	-- 2) when to load: after a buffer is read (so it picks up colors in your file)
	event = "BufReadPost",

	-- 3) optional: you can also only load it for certain filetypes
	-- ft = { 'css', 'scss', 'html', 'javascript', 'lua', 'vim', 'javascriptreact', 'typescriptreact' },

	-- 4) plugin config
	config = function()
		require("colorizer").setup(
		-- which files to colorize: here “every buffer”
			{ "*" },
			{
				-- options (all on by default; tweak to your liking)
				RGB = true, -- `#rgb`
				RRGGBB = true, -- `#rrggbb`
				names = true, -- "Name"
				RRGGBBAA = true, -- `#rrggbbaa`
				rgb_fn = true, -- CSS rgb()
				hsl_fn = true, -- CSS hsl()
				css = false, -- disables built-in CSS parser
				css_fn = false, -- disables all CSS functions: rgb_fn, hsl_fn, etc.
			}
		)
	end,
},
}
