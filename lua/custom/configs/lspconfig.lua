local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities
local init = config.on_init

local lspconfig = require("lspconfig")
local servers = { "ts_ls", "svelte", "tailwindcss", "html-lsp","css-lsp"}

-- lsps with default config
lspconfig.tailwindcss.setup{
  on_attach = on_attach;
  capabilities = capabilities;
}
lspconfig.html.setup {
  on_attach = on_attach;
  capabilities = capabilities;
}

lspconfig.cssls.setup {
  on_attach = on_attach;
  capabilities = capabilities;
}

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }, -- TSX included
  cmd = { "typescript-language-server", "--stdio" },
}
lspconfig.emmet_ls.setup({
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "less", "sass", "scss" },
  on_attach =  on_attach

    -- Optionally add custom on_attach behavior here
})
lspconfig.clangd.setup {
  on_attach = function (client,bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client,bufnr)
  end,
  capabilities = capabilities

}
