-- return {
-- 	"savq/melange-nvim",
-- 	config = function()
-- 		vim.cmd.colorscheme 'melange'
-- 	end
-- }
return {
	"rebelot/kanagawa.nvim",
	config = function()
		require('kanagawa').setup({
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
		})
		local themes = {
			"kanagawa-wave",
			"kanagawa-dragon",
			"kanagawa-lotus",
		}
		local index = 1
		vim.cmd.colorscheme(themes[index]) -- default
		vim.keymap.set("n", "<leader>t", function()
			index = (index % #themes) + 1
			vim.cmd.colorscheme(themes[index])
		end, { desc = "Cycle Kanagawa themes" })
	end
}
