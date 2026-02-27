return {
	'akinsho/toggleterm.nvim',
	lazy = false,
	config = function()
		local term = require("toggleterm")
		term.setup({
			direction = 'float',
		})

		vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
		vim.keymap.set({ "n", "i", "v" }, "<C-.>", "<cmd>TermSelect<cr>", {})
		vim.keymap.set("t", "<C-.>", [[<C-\><C-n><cmd>TermSelect<cr>]])
		vim.keymap.set("t", "<C-/>", [[<C-\><C-n><cmd>ToggleTerm<cr>]])
		vim.keymap.set({ "n", "i", "v" }, "<C-/>", "<cmd>ToggleTerm<cr>", {})
		vim.keymap.set({"t"}, "<C-x>", [[<C-\><C-n><cmd>:bw!<cr>]], {})

	end
}
