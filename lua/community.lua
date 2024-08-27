-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

-- vim.o.background = "dark"

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- { import = "astrocommunity.colorscheme.vscode-nvim" },
  -- import/override with your plugins folder
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
}
