local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

-- Setup mason
require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        'denols',
        'ansiblels',
        'rust_analyzer',
        'clangd',
        "jedi_language_server",
        'html',
        'cssls',
        'texlab',
        "svelte",
        "tailwindcss",
        "astro",
        "prosemd_lsp",
        "gopls",
        "yamlls",
        "lua_ls",  -- needed for vim global fix
    },
    handlers = {
        lsp.default_setup,
    },
})

-- Fix "vim" global
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

-- CMP config
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
})

-- Preferences (optional)
lsp.set_sign_icons({
    error = 'E',
    warn  = 'W',
    hint  = 'H',
    info  = 'I'
})

-- Keymaps
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    local map = vim.keymap.set

    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    map("n", "<leader>vd", vim.diagnostic.open_float, opts)
    map("n", "[d", vim.diagnostic.goto_next, opts)
    map("n", "]d", vim.diagnostic.goto_prev, opts)
    map("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    map("n", "<leader>vrr", vim.lsp.buf.references, opts)
    map("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

-- Manual override for AnsibleLS
lspconfig.ansiblels.setup({
    filetypes = {"yaml"},
    settings = {
        ansible = {
            ansible = {
                path = "ansible",
                useFullyQualifiedCollectionNames = true
            },
            ansibleLint = {
                enabled = true,
                path = "ansible-lint"
            },
            executionEnvironment = {
                enabled = false
            },
            python = {
                interpreterPath = "python"
            },
            completion = {
                provideRedirectModules = true,
                provideModuleOptionAliases = true
            }
        },
    },
    on_attach = function(client, bufnr)
        -- optional if not already included in default
        lsp.on_attach(client, bufnr)
    end,
})

-- Finalize setup
vim.diagnostic.config({
    virtual_text = true
})
