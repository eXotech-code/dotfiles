-- Load user config
require('user.lsp')

-- Clipboard
vim.opt.clipboard = 'unnamedplus'
vim.wo.wrap = false

-- Tabwidth
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.api.nvim_create_autocmd("FileType", {
	pattern = "asm",
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
	end
})

-- Numbers
vim.wo.number = true

-- Work nicely with tmux
vim.opt.background = 'dark'

-- Plugins
require('plugins')

-- Comment toggle
require'nvim_comment'.setup()

-- Colors
require('nord').set()

-- TODOS
require('todo-comments').setup()

-- Project browser
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

local function tab_win_closed(winnr)
  local api = require"nvim-tree.api"
  local tabnr = vim.api.nvim_win_get_tabpage(winnr)
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local buf_info = vim.fn.getbufinfo(bufnr)[1]
  local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
  local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
  if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
    -- Close all nvim tree on :q
    if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
      api.tree.close()
    end
  else                                                      -- else closed buffer was normal buffer
    if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
      local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
      if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
        vim.schedule(function ()
          if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
            vim.cmd "quit"                                        -- then close all of vim
          else                                                  -- else there are more tabs open
            vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
          end
        end)
      end
    end
  end
end

vim.api.nvim_create_autocmd("WinClosed", {
  callback = function ()
    local winnr = tonumber(vim.fn.expand("<amatch>"))
    vim.schedule_wrap(tab_win_closed(winnr))
  end,
  nested = true
})

require('nvim-tree').setup()

local function open_nvim_tree()
	require('nvim-tree.api').tree.open()
end

-- Syntax highlighting
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "svelte", "lua", "latex", "typescript" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
}

-- LSP
local on_attach = function(client, bufnr)
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'lr', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
end
require'lspconfig'.svelte.setup{ on_attach = on_attach }


-- Format on save overrides
local filetypes = {"c", "yaml"}

for _, filetype in ipairs(filetypes) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetype,
    callback = require('user.lsp.handlers').disable_format_on_save
  })
end

-- Key mappings
vim.keymap.set('n', '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>n', require('nvim-tree.api').tree.toggle, nil)
vim.keymap.set('n', '<leader>w', '<c-w>', nil)
vim.keymap.set('n', '<leader>x', function() require('trouble').toggle() end)
vim.keymap.set('n', '<leader>d', vim.lsp.buf.references) 

