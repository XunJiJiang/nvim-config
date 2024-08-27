-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim",
  {
    -- 显示函数签名
    "ray-x/lsp_signature.nvim",
    enabled = false,
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    opts = function(_, opts)
      for _, button in ipairs(opts.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      opts.section.buttons.opts.hl = "AlphaButtons"
      opts.section.footer.opts.hl = "AlphaFooter"
      -- opts.section.header.val = {
      --   "                                      ",
      --   "██╗  ██╗██╗   ██╗███╗   ██╗     ██╗██╗",
      --   "╚██╗██╔╝██║   ██║████╗  ██║     ██║██║",
      --   " ╚███╔╝ ██║   ██║██╔██╗ ██║     ██║██║",
      --   " ██╔██╗ ██║   ██║██║╚██╗██║██   ██║██║",
      --   "██╔╝ ██╗╚██████╔╝██║ ╚████║╚█████╔╝██║",
      --   "╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚════╝ ╚═╝",
      --   "                                      ",
      --   "   ███╗   ██╗██╗   ██╗██╗███╗   ███╗  ",
      --   "   ████╗  ██║██║   ██║██║████╗ ████║  ",
      --   "   ██╔██╗ ██║██║   ██║██║██╔████╔██║  ",
      --   "   ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║  ",
      --   "   ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║  ",
      --   "   ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  ",
      --   "                                      ",
      -- }
      return opts
    end,
    config = function()
      local dashboard = require "alpha.themes.dashboard"

      -- helper function for utf8 chars
      local function getCharLen(s, pos)
        local byte = string.byte(s, pos)
        if not byte then return nil end
        return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
      end

      local function applyColors(logo, colors, logoColors)
        dashboard.section.header.val = logo

        for key, color in pairs(colors) do
          local name = "Alpha" .. key
          vim.api.nvim_set_hl(0, name, color)
          colors[key] = name
        end

        dashboard.section.header.opts.hl = {}
        for i, line in ipairs(logoColors) do
          local highlights = {}
          local pos = 0

          for j = 1, #line do
            local opos = pos
            pos = pos + getCharLen(logo[i], opos + 1)

            local color_name = colors[line:sub(j, j)]
            if color_name then table.insert(highlights, { color_name, opos, pos }) end
          end

          table.insert(dashboard.section.header.opts.hl, highlights)
        end
        return dashboard.opts
      end
      require("alpha").setup(applyColors({
        [[  ███       ███  ]],
        [[  ████      ████ ]],
        [[  ████     █████ ]],
        [[ █ ████    █████ ]],
        [[ ██ ████   █████ ]],
        [[ ███ ████  █████ ]],
        [[ ████ ████ ████ ]],
        [[ █████  ████████ ]],
        [[ █████   ███████ ]],
        [[ █████    ██████ ]],
        [[ █████     █████ ]],
        [[ ████      ████ ]],
        [[  ███       ███  ]],
        [[                    ]],
        [[  N  E  O  V  I  M  ]],
      }, {
        ["b"] = { fg = "#3399ff", ctermfg = 33 },
        ["a"] = { fg = "#53C670", ctermfg = 35 },
        ["g"] = { fg = "#39ac56", ctermfg = 29 },
        ["h"] = { fg = "#33994d", ctermfg = 23 },
        ["i"] = { fg = "#33994d", bg = "#39ac56", ctermfg = 23, ctermbg = 29 },
        ["j"] = { fg = "#53C670", bg = "#33994d", ctermfg = 35, ctermbg = 23 },
        ["k"] = { fg = "#30A572", ctermfg = 36 },
      }, {
        [[  kkkka       gggg  ]],
        [[  kkkkaa      ggggg ]],
        [[ b kkkaaa     ggggg ]],
        [[ bb kkaaaa    ggggg ]],
        [[ bbb kaaaaa   ggggg ]],
        [[ bbbb aaaaaa  ggggg ]],
        [[ bbbbb aaaaaa igggg ]],
        [[ bbbbb  aaaaaahiggg ]],
        [[ bbbbb   aaaaajhigg ]],
        [[ bbbbb    aaaaajhig ]],
        [[ bbbbb     aaaaajhi ]],
        [[ bbbbb      aaaaajh ]],
        [[  bbbb       aaaaa  ]],
        [[                    ]],
        [[  a  a  a  b  b  b  ]],
      }))
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- 自动补全一些语言(如java, js)的类型注释
  {
    "L3MON4D3/LuaSnip",
    enabled = false,
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  -- 这个插件在当前配置下启用会导致自动补全另一半的括号失效
  --   Before        Input         After
  -- ------------------------------------
  -- {|}           <CR>          {
  --                                 |
  --                             }
  -- ------------------------------------
  -- {
  --   "windwp/nvim-autopairs",
  --   enabled = false,
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
}

-- 字符画生成网站: https://patorjk.com/software/taag/#p=display&f=Big&t=Type%20Something%20
-- 字体: ANSI Regular https://patorjk.com/software/taag/#p=display&f=ANSI%20Regular
-- "██   ██ ██    ██ ███    ██      ██ ██",
-- " ██ ██  ██    ██ ████   ██      ██ ██",
-- "  ███   ██    ██ ██ ██  ██      ██ ██",
-- " ██ ██  ██    ██ ██  ██ ██ ██   ██ ██",
-- "██   ██  ██████  ██   ████  █████  ██",
-- "                                     ",
-- "   ███    ██ ██    ██ ██ ███    ███  ",
-- "   ████   ██ ██    ██ ██ ████  ████  ",
-- "   ██ ██  ██ ██    ██ ██ ██ ████ ██  ",
-- "   ██  ██ ██  ██  ██  ██ ██  ██  ██  ",
-- "   ██   ████   ████   ██ ██      ██  ",

-- 字体: ANSI Shadow https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow
-- "██╗  ██╗██╗   ██╗███╗   ██╗     ██╗██╗",
-- "╚██╗██╔╝██║   ██║████╗  ██║     ██║██║",
-- " ╚███╔╝ ██║   ██║██╔██╗ ██║     ██║██║",
-- " ██╔██╗ ██║   ██║██║╚██╗██║██   ██║██║",
-- "██╔╝ ██╗╚██████╔╝██║ ╚████║╚█████╔╝██║",
-- "╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚════╝ ╚═╝",
-- "                                      ",
-- "   ███╗   ██╗██╗   ██╗██╗███╗   ███╗  ",
-- "   ████╗  ██║██║   ██║██║████╗ ████║  ",
-- "   ██╔██╗ ██║██║   ██║██║██╔████╔██║  ",
-- "   ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║  ",
-- "   ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║  ",
-- "   ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  ",

-- Block https://patorjk.com/software/taag/#p=display&f=Block
-- "_|      _|  _|    _|  _|      _|        _|  _|_|_|",
-- "  _|  _|    _|    _|  _|_|    _|        _|    _|  ",
-- "    _|      _|    _|  _|  _|  _|        _|    _|  ",
-- "  _|  _|    _|    _|  _|    _|_|  _|    _|    _|  ",
-- "_|      _|    _|_|    _|      _|    _|_|    _|_|_|",
-- "                                                  ",
-- "    _|      _|  _|      _|  _|_|_|  _|      _|    ",
-- "    _|_|    _|  _|      _|    _|    _|_|  _|_|    ",
-- "    _|  _|  _|  _|      _|    _|    _|  _|  _|    ",
-- "    _|    _|_|    _|  _|      _|    _|      _|    ",
-- "    _|      _|      _|      _|_|_|  _|      _|    ",

-- Lean
-- "     _/      _/  _/    _/  _/      _/        _/  _/_/_/",
-- "      _/  _/    _/    _/  _/_/    _/        _/    _/   ",
-- "       _/      _/    _/  _/  _/  _/        _/    _/    ",
-- "    _/  _/    _/    _/  _/    _/_/  _/    _/    _/     ",
-- " _/      _/    _/_/    _/      _/    _/_/    _/_/_/    ",
-- "                                                       ",
-- "     _/      _/  _/      _/  _/_/_/  _/      _/        ",
-- "    _/_/    _/  _/      _/    _/    _/_/  _/_/         ",
-- "   _/  _/  _/  _/      _/    _/    _/  _/  _/          ",
-- "  _/    _/_/    _/  _/      _/    _/      _/           ",
-- " _/      _/      _/      _/_/_/  _/      _/            ",
