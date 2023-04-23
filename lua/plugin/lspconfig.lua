local lsp = require('lspconfig')
local nls = require('null-ls')
local nb = nls.builtins
local tb = require('telescope.builtin')

local ERROR = vim.diagnostic.severity.ERROR
local WARN = vim.diagnostic.severity.WARN
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    client.server_capabilities.document_formatting = true
    client.server_capabilities.document_range_formatting = true

    local opts = { noremap = true, silent = true, buffer = bufnr }
    local width = { fname_width = 80, symbol_width = 60, symbol_type_width = 30, trim_text = true }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gR', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gf', vim.lsp.buf.format, opts)

    vim.keymap.set('n', 'gd', tb.lsp_definitions, opts)
    vim.keymap.set('n', 'gt', tb.lsp_type_definitions, opts)

    vim.keymap.set('n', 'gr', function() tb.lsp_references(width) end, opts)
    vim.keymap.set('n', 'gI', function() tb.lsp_implementations(width) end, opts)
    vim.keymap.set('n', 'gi', function() tb.lsp_incoming_calls(width) end, opts)
    vim.keymap.set('n', 'go', function() tb.lsp_outgoing_calls(width) end, opts)

    vim.keymap.set('n', 'gs', function() tb.lsp_document_symbols(width) end, opts)
    vim.keymap.set('n', 'gS', function() tb.lsp_dynamic_workspace_symbols(width) end, opts)

    vim.keymap.set('n', 'gE', function() tb.diagnostics { line_width = 100, severity_limit = ERROR } end, opts)
    vim.keymap.set('n', 'ge', function() tb.diagnostics { bufnr = 0, severity_limit = ERROR } end, opts)
    vim.keymap.set('n', 'gW', function() tb.diagnostics { line_width = 100, severity_bound = WARN } end, opts)
    vim.keymap.set('n', 'gw', function() tb.diagnostics { bufnr = 0, severity_bound = WARN } end, opts)
end

lsp.gopls.setup({
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
                unusedvariable = true
            },
            allExperiments = true,
            staticcheck = true,
            gofumpt = true,
        },
    },
})

lsp.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
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

lsp.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            format = { enable = true, defaultConfig = { indent_style = 'space' } },
            runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
            diagnostics = { globals = { 'vim' }, neededFileStatus = { ['codestyle-check'] = 'Any' } },
            workspace = { library = vim.api.nvim_get_runtime_file('', true) },
        }
    }
})

local sources = {
    nb.code_actions.refactoring,
    nb.code_actions.shellcheck,
    nb.code_actions.gitsigns,
    nb.code_actions.proselint,

    nb.diagnostics.actionlint,
    nb.diagnostics.ansiblelint,
    nb.diagnostics.buf,
    nb.diagnostics.golangci_lint,
    nb.diagnostics.jsonlint,
    nb.diagnostics.markdownlint,
    nb.diagnostics.mypy,
    nb.diagnostics.proselint,
    nb.diagnostics.shellcheck,
    nb.diagnostics.yamllint,
    nb.diagnostics.zsh,

    nb.formatting.buf,
    nb.formatting.cmake_format,
    nb.formatting.jq,
    nb.formatting.markdownlint,
    nb.formatting.prettier,
    nb.formatting.shfmt,

    nb.hover.dictionary,
}

nls.setup({
    on_attach = on_attach,
    sources = sources,
    diagnostics_format = '[#{c}] #{m} (#{s})'
})

vim.api.nvim_create_autocmd('DirChanged', {
    callback = function() vim.lsp.stop_client(vim.lsp.get_active_clients()) end
})
