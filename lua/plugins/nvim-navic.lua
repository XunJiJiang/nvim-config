if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "SmiteshP/nvim-navic",
    config = function()
      require("nvim-navic").setup()
    end,
  }
}