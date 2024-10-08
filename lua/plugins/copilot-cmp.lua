if true then return {} end

-- copilot-cmp

return {
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
    dependencies = {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      config = function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false }
        })
      end
    },
    opts = function (_, opts)
      local cmp = require("cmp")
      local has_words_before = function ()
        if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
      end
      opts.scurces = cmp.config.sources({
        { name = "copilot", group_index = 2},
        { name = "nvim_lsp", group_index = 2},
        { name = "path", group_index = 2},
        { name = "luasnip", group_index = 2}
      })
      opts.mappings = {
        ["<Tab>"] = vim.schedule_wrap(function()
          if cmp.visible() and has_words_before() then
            cmp.select_next_item({
              behavior = cmp.SelectBehavior.Select
            })
          end
        end)
      }
    end
  }
}
