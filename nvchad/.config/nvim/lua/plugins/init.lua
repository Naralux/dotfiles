return {

  --
  -- Formatting
  --
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  --
  -- LSPs/DAPs/Linters/Formatters
  --
  {
    "williamboman/mason.nvim",
    opts = function()
      require "configs.mason"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },
}
