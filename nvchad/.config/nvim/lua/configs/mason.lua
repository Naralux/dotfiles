local options = {
  PATH = "prepend",
}

vim.tbl_deep_extend("keep", options, require "nvchad.configs.mason")
