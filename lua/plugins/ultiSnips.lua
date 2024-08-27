if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "SirVer/ultisnips",
    requires = { "honza/vim-snippets" },
    config = function()
      vim.g.UltiSnipsExpandTrigger = "<tab>"
      vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
    end,
  }
}