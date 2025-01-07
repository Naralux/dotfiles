return {

  {
    "jghauser/papis.nvim",
    dependencies = {
      "kkharji/sqlite.lua",
      "MunifTanjim/nui.nvim",
      "pysan3/pathlib.nvim",
      "nvim-neotest/nvim-nio",
      -- if not already installed, you may also want:
      -- "nvim-telescope/telescope.nvim",
      -- "hrsh7th/nvim-cmp",

    },
    ft = "markdown",
    config = function()
      require("papis").setup({
        -- Your configuration goes here
        enable_modules = {
          ["search"] = true,          -- Enables/disables the search module
          ["completion"] = false,      -- Enables/disables the completion module
          ["at-cursor"] = true,       -- Enables/disables the at-cursor module
          ["formatter"] = true,       -- Enables/disables the formatter module
          ["colors"] = true,          -- Enables/disables default highlight groups (you
                                      -- probably want this)
          ["base"] = true,            -- Enables/disables the base module (you definitely
                                      -- want this)
          ["debug"] = false,          -- Enables/disables the debug module (useful to
                                      -- troubleshoot and diagnose issues)
        },
        enable_keymaps = true,
        init_filetypes = { "markdown" },
      })
    end,
  }

}
