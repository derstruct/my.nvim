return {
	"doors-dev/nvim-gox",
	dependencies = { "nvim-treesitter/nvim-treesitter", 'neovim/nvim-lspconfig' },
	config = function()
		require("gox").setup({
			bin = {
			},
			treesitter = {
				start_go = true,
				fold = false,
			},
		})
	end,
}

