-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "xiyaowong/transparent.nvim",
    opts = function()
      local transparent = require('transparent')
      -- transparent.clear_prefix('nvim-notify')
      transparent.clear_prefix('NeoTree')
      -- transparent.clear_prefix('heirline')
      require("notify").setup({
        stages = "slide",
      })
    end,
  }
}