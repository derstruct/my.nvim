return {
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
	{

		'nvim-telescope/telescope.nvim',
		version = '*',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-y>"] = actions.select_default,
							["<C-t>"] = actions.select_tab,
							["<C-CR>"] = actions.select_default,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<Up>"] = actions.preview_scrolling_up,
							["<Down>"] = actions.preview_scrolling_down,
							["<Left>"] = actions.preview_scrolling_left,
							["<Right>"] = actions.preview_scrolling_right,
						},
						n = {
							["<C-y>"] = actions.select_default,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-t>"] = actions.select_tab,
						},
					},
				},
				extensions = {
					file_browser = {
						grouped = true,
						hijack_netrw = true,
						layout_config = {
							prompt_position = "top",
						},
						sorting_strategy = 'ascending',
					},
				},

			})
			telescope.load_extension("file_browser")
			vim.keymap.set("n", "<leader>fc", builtin.current_buffer_fuzzy_find, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fs", builtin.treesitter, {})
			vim.keymap.set("n", "<leader>fh", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>fm", builtin.marks, {})
			vim.keymap.set({ "n", "v" }, "<leader>l", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, {})
			vim.keymap.set("n", "<leader>gt", builtin.lsp_type_definitions, {})
			vim.keymap.set("n", "<leader>gr", builtin.lsp_references, {})
			vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, {})
			vim.keymap.set("n", "<leader>gc", builtin.lsp_incoming_calls, {})
		end
	}
}
