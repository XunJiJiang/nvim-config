-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS TILE

local hl_init = require "highlight.init"

vim.o.background = "dark"

return {
  "Mofiqul/vscode.nvim",
  name = "vscode",
  -- opts = function()  end,
  config = function()
    -- local c = require("vscode.colors").get_colors()
    require("vscode").setup {
      -- Alternatively set style in setup
      -- style = "light",
      -- 透明背景
      transparent = true,
      -- 斜体注释
      italic_comments = true,
      -- Underline `@markup.link.*` variants
      underline_links = true,
      -- 关闭 nvim-tree 背景色
      disable_nvimtree_bg = true,
      -- 覆盖颜色 (see ./lua/vscode/colors.lua)
      -- color_overrides = {},
      -- 重写高亮组 (见 ./lua/vscode/theme.lua)
      group_overrides = hl_init.set_highlights(),
    }
  end,
}
