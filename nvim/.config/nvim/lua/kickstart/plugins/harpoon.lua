-- Harpoon
return {
{
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			global_settings = {
				save_on_toggle = false,
				save_on_change = true,
				enter_on_sendcmd = false,
				tmux_autoclose_windows = false,
				exclude_filetypes = { "harpoon" },
				mark_branch = true
			}
		})

		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in pairs(harpoon_files.items) do
				if item and item.value then
					table.insert(file_paths, item.value)
				end
			end

			require("telescope.pickers").new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			}):find()
		end

		-- Base commands
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Harpoon: Add file to list" })

		vim.keymap.set("n", "<leader>he", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Harpoon: Open list" })

		-- Next & Back navigation
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "Harpoon: Next file" })

		vim.keymap.set("n", "<leader>hb", function()
			harpoon:list():prev()
		end, { desc = "Harpoon: Back (previous) file" })

		for i = 1, 9 do
			-- Select file
			vim.keymap.set("n", string.format("<leader>%d", i), function()
				harpoon:list():select(i)
			end, { desc = string.format("Harpoon: Open file %d", i) })

			-- Delete file
			vim.keymap.set("n", string.format("<leader>d%d", i), function()
				harpoon:list():remove_at(i)
			end, { desc = string.format("Harpoon: Delete file %d", i) })
		end
	end,
}
}
