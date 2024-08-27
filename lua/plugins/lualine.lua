if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- lualine.nvim

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local vscode = require "lualine.themes.vscode"
      require("lualine").setup {
        options = {
          theme = vscode,
          section_separators = { "", "" },
          component_separators = { "", "" },
        },
      }
    end,
  },
}
