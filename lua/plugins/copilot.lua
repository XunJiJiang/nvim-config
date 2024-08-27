-- if true then return {} end

-- Copilot

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

-- <M- 表示 alt 键 或 meta 键
-- <A- 表示 alt 键
-- <C- 表示 ctrl 键
-- <S- 表示 shift 键
-- <CR> 表示回车键
-- <Tab> 表示 tab 键
-- <Space> 表示空格键
-- <Esc> 表示 esc 键
-- <BS> 表示退格键
-- <Del> 表示删除键
-- <Home> 表示 home 键
-- <End> 表示 end 键
-- <Up> 表示上箭头键
-- <Down> 表示下箭头键
-- <Left> 表示左箭头键
-- <Right> 表示右箭头键
-- <PageUp> 表示 page up 键
-- <PageDown> 表示 page down 键
-- <F1> 表示 F1 键
-- <F2> 表示 F2 键
-- <F3> 表示 F3 键
-- <F4> 表示 F4 键
-- <F5> 表示 F5 键
-- <F6> 表示 F6 键
-- <F7> 表示 F7 键
-- <F8> 表示 F8 键
-- <F9> 表示 F9 键
-- <F10> 表示 F10 键
-- <F11> 表示 F11 键
-- <F12> 表示 F12 键

-- <M-CR> 打开copilot面板
-- [[ 跳到下一条
-- ]] 跳到上一条
-- <CR> 接受
-- gr 刷新
--
-- <M-l> 接受建议
-- <M-k> 接受下一个单词
-- <M-]> 下一条建议
-- <M-[> 上一条建议
-- <C-]> 放弃建议

---@type LazySpec
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = function()
      require("copilot").setup({
        -- suggestion = { enabled = false},
        -- panel = { enabled = false },
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = false,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = "<M-k>",
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },
  -- {
  --   "github/copilot.vim",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   lazy = true,
  --   config = function ()
  --     require("copilot").setup({})
  --   end,
  -- }
}
