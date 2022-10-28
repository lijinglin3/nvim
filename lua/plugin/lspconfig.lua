local lsp = require('lspconfig')
local nls = require('null-ls')
local builtins = nls.builtins

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    client.server_capabilities.document_formatting = true
    client.server_capabilities.document_range_formatting = true

    local builtin = require('telescope.builtin')
    local ERROR = vim.diagnostic.severity.ERROR
    local WARN = vim.diagnostic.severity.WARN
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gR', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gf', vim.lsp.buf.format, opts)

    vim.keymap.set('n', 'gs', function() builtin.lsp_document_symbols {} end, opts)
    vim.keymap.set('n', 'gS', function() builtin.lsp_dynamic_workspace_symbols { fname_width = 60 } end, opts)
    vim.keymap.set('n', 'gd', function() builtin.lsp_definitions {} end, opts)
    vim.keymap.set('n', 'gt', function() builtin.lsp_type_definitions {} end, opts)
    vim.keymap.set('n', 'go', function() builtin.lsp_outgoing_calls { fname_width = 100 } end, opts)
    vim.keymap.set('n', 'gi', function() builtin.lsp_incoming_calls { fname_width = 100 } end, opts)
    vim.keymap.set('n', 'gI', function() builtin.lsp_implementations { fname_width = 60 } end, opts)
    vim.keymap.set('n', 'gr', function() builtin.lsp_references { fname_width = 60 } end, opts)

    vim.keymap.set('n', 'gE', function() builtin.diagnostics { line_width = 80, severity_limit = ERROR } end, opts)
    vim.keymap.set('n', 'ge', function() builtin.diagnostics { bufnr = 0, severity_limit = ERROR } end, opts)
    vim.keymap.set('n', 'gW', function() builtin.diagnostics { line_width = 80, severity_bound = WARN } end, opts)
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
        format = { enable = true, defaultConfig = { indent_style = 'space' } },
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

vim.api.nvim_create_autocmd('DirChanged', { callback = function()
    vim.lsp.stop_client(vim.lsp.get_active_clients())
end })
