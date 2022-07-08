local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, opts)
	vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
	vim.keymap.set('n', 'gR', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	vim.keymap.set('n', 'gf', vim.lsp.buf.formatting, opts)

	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)

	vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
	vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
end

require('lspconfig').clangd.setup({on_attach = on_attach})
require('lspconfig').gopls.setup({on_attach = on_attach})
require('lspconfig').jsonls.setup({on_attach = on_attach})
require('lspconfig').pyright.setup({on_attach = on_attach})
