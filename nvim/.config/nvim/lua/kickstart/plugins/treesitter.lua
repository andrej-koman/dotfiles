-- Treesitter
return {
{ -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"go",
			"gomod",
			"gowork",
			"gosum",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"vue",
			"typescript",
			"tsx",
			"javascript",
		},
		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
			-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
			--  If you are experiencing weird indenting issues, add the language to
			--  the list of additional_vim_regex_highlighting and disabled languages for indent.
			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = { enable = true, disable = { "ruby" } },
	},
	config = function(_, opts)
		-- Setup custom parser
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}

		vim.filetype.add({
			pattern = {
				['.*%.blade%.php'] = 'blade',
			}
		})

		local bladeGrp = vim.api.nvim_create_augroup("BladeFiltypeRelated", { clear = true })
		vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
			pattern = "*.blade.php",
			group = bladeGrp,
			callback = function()
				vim.opt.filetype = "blade"
			end,
		})

		require("nvim-treesitter.configs").setup(opts)
	end
},
{
	'nvim-treesitter/nvim-treesitter-context',
	opts = {
		enable = true,
		max_lines = 1,
		line_numbers = true,
		trim_scope = 'outer',
		patterns = {
			default = {
				'class',
				'function',
				'method',
			},
			html = {
				'element',
			},
			markdown = {
				'section'
			},
			php = {
				'function_definition',
				'method_declaration'
			},
			javascript = {
				'function_declaration',
				'method_definition',
				'arrow_function',
				'function'
			}
		},
		zindex = 20,
		mode = 'cursor',
	},
},
{
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup({
			filetypes = {
				"html",
				"xml",
				"vue",
				"svelte",
				"typescriptreact",
				"javascriptreact",
			},
		})
	end,
},
}
