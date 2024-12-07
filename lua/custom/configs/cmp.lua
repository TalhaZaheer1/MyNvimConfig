local cmp = require "cmp"


cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- or use your preferred snippet engine
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-y>"] = cmp.mapping.confirm { select = true },
    ["<C-Space>"] = cmp.mapping.complete(),
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp" }, -- Autocompletion from LSP
    { name = "buffer" },   -- Buffer completions
    { name = "path" },     -- File path completions
  },
}

