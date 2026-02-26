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
			local action_state = require("telescope.actions.state")
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
			--[[
			/*
			local function lsp_picker_or_jump(opts)
				local method = opts.method
				local picker = opts.picker
				return function()
					local win = vim.api.nvim_get_current_win()
					local clients = vim.lsp.get_clients({ bufnr = 0 })
					local params = vim.lsp.util.make_position_params(win, clients[1].offset_encoding or 'utf-8')
					vim.lsp.buf_request(0, method, params, function(_, result, ctx, _)
						if not result or vim.tbl_isempty(result) then
							print("No result found")
							return
						end

						local items = vim.lsp.util.locations_to_items(result,
						vim.lsp.get_client_by_id(ctx.client_id).offset_encoding)
						if #items == 1 then
							local loc = items[1]
							local target_path = vim.fn.fnamemodify(loc.filename, ':p')
							local current_path = vim.fn.expand('%:p')
							if target_path == current_path then
								vim.api.nvim_win_set_cursor(0, { loc.lnum, loc.col })
								vim.cmd("normal! zvzz")
								return
							end
						end

						-- Open picker for any case except "one result && current buffer"
						builtin[picker]({ jump_type = "never" })
					end)
				end
			end --]]

			--[[
			vim.keymap.set('n', '<leader>gd', lsp_picker_or_jump {
				method = "textDocument/definition",
				picker = "lsp_definitions",
			}, {})

			vim.keymap.set('n', '<leader>gt', lsp_picker_or_jump {
				method = "textDocument/typeDefinition",
				picker = "lsp_type_definitions",
			}, {})

			vim.keymap.set('n', '<leader>gr', lsp_picker_or_jump {
				method = "textDocument/references",
				picker = "lsp_references",
			}, {})

			vim.keymap.set('n', '<leader>gi', lsp_picker_or_jump {
				method = "textDocument/implementation",
				picker = "lsp_implementations",
			}, {})
			vim.keymap.set('n', '<leader>gc', lsp_picker_or_jump {
				method = "callHierarchy/incomingCalls",
				picker = "lsp_incoming_calls",
			}, {}) --]]
		end
	}
}
