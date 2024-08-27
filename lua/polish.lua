vim.opt.fileformats = "unix"

-- 普通模式光标颜色: 背景色为 rgb(86, 224, 224)，前景色为黑色
-- vim.api.nvim_set_hl(0, "Cursor", { fg = "#000000", bg = "#56E0E0" })

-- 插入模式光标颜色: 背景色为 rgb(86, 224, 224)，前景色为白色
-- vim.api.nvim_set_hl(0, "iCursor", { fg = "#FFFFFF", bg = "#56E0E0" })

if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}
