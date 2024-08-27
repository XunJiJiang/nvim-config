-- if true then return {} end -- WARit REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function()
    return {
      ensure_installed = {
        "lua",
        "vim",
        "typescript",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "javascript.jsx",
        "typescript.tsx",
        "vue",
        "json",
        "html",
        "css",
        "scss",
        "less",
        "yaml",
        "markdown",
        "rust",
        -- add more arguments for adding more treesitter parsers
      },
    }
  end,
  config = function() end,
}
