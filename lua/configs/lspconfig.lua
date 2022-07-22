local builtin = require('telescope.builtin')

local on_attach = function(client, bufnr)
	local opts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, opts)
	vim.keymap.set('n', 'gR', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', 'gf', vim.lsp.buf.formatting, opts)

	vim.keymap.set("n", "gs", builtin.lsp_document_symbols, opts)
	vim.keymap.set("n", "gl", builtin.lsp_dynamic_workspace_symbols, opts)
	vim.keymap.set("n", "go", builtin.lsp_outgoing_calls, opts)
	vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
	vim.keymap.set("n", "gt", builtin.lsp_type_definitions, opts)
	vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
	vim.keymap.set("n", "gr", builtin.lsp_references, opts)
	vim.keymap.set("n", "ge", builtin.diagnostics, opts)

	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = false

require('lspconfig').gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		gopls = {
			analyses = {
				fieldalignment = true,
				nilness = true,
				shadow = true,
				unusedparams = true,
				unusedwrite = true,
				useany = true,
				unusedvariable = true,
			},
			allExperiments = true,
			staticcheck = true,
			gofumpt = true,
		},
	},
})

require('lspconfig').clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require('lspconfig').jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require('lspconfig').pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
