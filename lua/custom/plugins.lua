local plugins = {
   -- Snippet engine
  { "hrsh7th/vim-vsnip" },
  -- Predefined snippets for React and TypeScript
  { "rafamadriz/friendly-snippets" },
{
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- optional
    "neovim/nvim-lspconfig", -- optional
  config = function ()
    require("tailwind-tools").setup()
  end
  }},
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
    event = "VeryLazy",
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },
{
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "svelte-language-server",
        "tailwindcss-language-server",
        "html-lsp",
        "css-lsp",
        "prettier",
        "emmet-ls",
        "clangd",
        "clang-format"
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
