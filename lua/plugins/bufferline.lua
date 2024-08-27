if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- 改用heirline.nvim

-- Bufferline provides a simple way to manage buffers

vim.opt.termguicolors = true

return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "BufWinEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = function()
      local bufferline = require "bufferline"
      bufferline.setup {
        options = {
          -- buffer_close_icon = "",
          close_command = "bdelete %d",
          close_icon = "",
          -- indicator = { style = "none" },
          modified_icon = "●",
          offsets = { { filetype = "NeoTree", text = "EXPLORER", text_align = "center" } },
          middle_mouse_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          -- left_trunc_marker = "",
          -- right_trunc_marker = "",
          show_close_icon = false,
          -- show_tab_indicators = false, -- TODO: 没有效果
          -- numbers = "ordinal", -- TODO: 没有效果
          -- diagnostics = "nvim_lsp", -- TODO: 没有效果
          -- diagnostics_update_on_event = true, -- TODO: 没有效果
        },
        highlights = {
          fill = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLineNC" },
          },
          background = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLine" },
          },
          --   buffer_visible = {
          --     fg = { attribute = "fg", highlight = "Normal" },
          --     bg = { attribute = "bg", highlight = "Normal" },
          --   },
          --   buffer_selected = {
          --     fg = { attribute = "fg", highlight = "Normal" },
          --     bg = { attribute = "bg", highlight = "Normal" },
          --   },
          --   separator = {
          --     fg = { attribute = "bg", highlight = "Normal" },
          --     bg = { attribute = "bg", highlight = "StatusLine" },
          --   },
          --   separator_selected = {
          --     fg = { attribute = "fg", highlight = "Special" },
          --     bg = { attribute = "bg", highlight = "Normal" },
          --   },
          --   separator_visible = {
          --     fg = { attribute = "fg", highlight = "Normal" },
          --     bg = { attribute = "bg", highlight = "StatusLineNC" },
          --   },
          close_button = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLine" },
          },
          close_button_selected = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
          },
          close_button_visible = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
          },
          tab_separator_selected = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
          },
        },
      }
    end,
  },
}

-- #0174cd
