local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities
local init = config.on_init

local lspconfig = require("lspconfig")
local servers = { "ts_ls", "svelte", "tailwindcss", "html"}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = init,
    capabilities = capabilities,
  }
end

lspconfig.ts_ls.setup {
  on_attach = config.on_attach,
  capabilities = config.capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }, -- TSX included
  cmd = { "typescript-language-server", "--stdio" },
}
lspconfig.emmet_ls.setup({
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "less", "sass", "scss" },
  on_attach =  on_attach

    -- Optionally add custom on_attach behavior here
})
