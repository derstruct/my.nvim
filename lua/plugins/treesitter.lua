local function enable(filetype) 
	vim.api.nvim_create_autocmd('FileType', {
	  pattern = { filetype },
	  callback = function() 
		  vim.treesitter.start() 
		  vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		  vim.wo.foldmethod = 'expr'
		  vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		  vim.wo.foldenable = true
		  vim.wo.foldlevel = 99
	  end,
	})
end


return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
	  local ts = require('nvim-treesitter')
	  ts.install({ 'lua' })
	  enable('lua')
  end
}
