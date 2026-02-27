return {
	"derstruct/shredder.nvim",
	lazy = false,
	config = function()
		local s = require("shredder")
		s.setup({
			width = 25,
		})
		vim.keymap.set({'n','v'}, '<leader> ', ':Shred<CR>', {})
	end,
}
