return {
	{
		'williamboman/mason.nvim',
		config = function()
			require("mason").setup()
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		opts = {
			ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", },
		},
	},
	{
        'neovim/nvim-lspconfig',
        lazy = false,
	}
}
