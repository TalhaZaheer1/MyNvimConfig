local plugins = {
   -- Snippet engine
  { "hrsh7th/vim-vsnip" },
  -- Predefined snippets for React and TypeScript
  { "rafamadriz/friendly-snippets" },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
{
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
      -- Integrate with nvim-cmp if installed
      local cmp = require("cmp")
      cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
  },
{
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup {
        sources = {
          require("null-ls").builtins.formatting.prettier,
        },
      }
    end,
  },
{
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "svelte-language-server",
        "tailwindcss-language-server",
        "vscode-langservers-extracted",
        "prettier",
        "emmet-ls"
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
     require "plugins.configs.lspconfig"
     require "custom.configs.lspconfig"
    end
  }
}
return plugins
