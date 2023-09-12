vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'terrortylor/nvim-comment'
	use 'shaunsingh/nord.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
	}
	use 'nvim-lua/plenary.nvim'
	use 'folke/todo-comments.nvim'
	use 'folke/trouble.nvim'
end)
