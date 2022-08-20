local lsp = require('lspconfig')
local nls = require('null-ls')
local builtins = nls.builtins

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	client.resolved_capabilities.document_formatting = true
	client.resolved_capabilities.document_range_formatting = true

	local builtin = require('telescope.builtin')
	local ERROR = vim.diagnostic.severity.ERROR
	local WARN = vim.diagnostic.severity.WARN
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, opts)
	vim.keymap.set('n', 'gR', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', 'gf', vim.lsp.buf.formatting, opts)

	vim.keymap.set('n', 'gs', builtin.lsp_document_symbols, opts)
	vim.keymap.set('n', 'gS', builtin.lsp_dynamic_workspace_symbols, opts)
	vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
	vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, opts)
	vim.keymap.set('n', 'go', builtin.lsp_outgoing_calls, opts)
	vim.keymap.set('n', 'gi', builtin.lsp_incoming_calls, opts)
	vim.keymap.set('n', 'gI', builtin.lsp_implementations, opts)
	vim.keymap.set('n', 'gr', builtin.lsp_references, opts)

	vim.keymap.set('n', 'gE', function() builtin.diagnostics { severity_limit = ERROR } end, opts)
	vim.keymap.set('n', 'ge', function() builtin.diagnostics { bufnr = 0, severity_limit = ERROR } end, opts)
	vim.keymap.set('n', 'gW', function() builtin.diagnostics { severity_bound = WARN } end, opts)
	vim.keymap.set('n', 'gw', function() builtin.diagnostics { bufnr = 0, severity_bound = WARN } end, opts)
end

lsp.gopls.setup({
	on_attach = on_attach, capabilities = capabilities,
	settings = {
		gopls = {
			analyses = {
				fieldalignment = true, nilness = true, shadow = true,
				unusedparams = true, unusedwrite = true, useany = true, unusedvariable = true
			},
			allExperiments = true, staticcheck = true, gofumpt = true,
		},
	},
})

lsp.rust_analyzer.setup({
	on_attach = on_attach, capabilities = capabilities,
	settings = {
		['rust-analyzer'] = {
			imports = { granularity = { group = 'module' }, prefix = 'self' },
			cargo = { allFeatures = true, buildScripts = { enable = true } },
			procMacro = { enable = true },
		}
	}
})

lsp.clangd.setup({ on_attach = on_attach, capabilities = capabilities })

lsp.pyright.setup({ on_attach = on_attach, capabilities = capabilities })

lsp.sumneko_lua.setup({
	on_attach = on_attach, capabilities = capabilities,
	settings = { Lua = {
		format = { enable = true, defaultConfig = { indent_style = 'tab' } },
		runtime = { version = 'LuaJIT', path = vim.split(package.path, ";") },
		diagnostics = { globals = { 'vim' }, neededFileStatus = { ['codestyle-check'] = 'Any' } },
		workspace = { library = vim.api.nvim_get_runtime_file('', true) },
	} }
})

local sources = {
	builtins.code_actions.refactoring,
	builtins.code_actions.shellcheck,
	builtins.code_actions.gitsigns,
	builtins.code_actions.proselint,

	builtins.diagnostics.actionlint,
	builtins.diagnostics.ansiblelint,
	builtins.diagnostics.buf,
	builtins.diagnostics.codespell,
	builtins.diagnostics.editorconfig_checker,
	builtins.diagnostics.golangci_lint,
	builtins.diagnostics.jsonlint,
	builtins.diagnostics.markdownlint,
	builtins.diagnostics.mypy,
	builtins.diagnostics.proselint,
	builtins.diagnostics.shellcheck,
	builtins.diagnostics.yamllint,
	builtins.diagnostics.zsh,

	builtins.formatting.buf,
	builtins.formatting.cmake_format,
	builtins.formatting.jq,
	builtins.formatting.markdownlint,
	builtins.formatting.prettier,
	builtins.formatting.shfmt,

	builtins.hover.dictionary,
}

nls.setup({
	on_attach = on_attach, sources = sources,
	diagnostics_format = '[#{c}] #{m} (#{s})'
})
