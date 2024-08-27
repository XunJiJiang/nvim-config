-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local conditions = require "heirline.conditions"
local utils = require "heirline.utils"

-- local colors = {
--   bright_bg = utils.get_highlight("Folded").bg,
--   bright_fg = utils.get_highlight("Folded").fg,
--   red = utils.get_highlight("DiagnosticError").fg,
--   dark_red = utils.get_highlight("DiffDelete").bg,
--   green = utils.get_highlight("String").fg,
--   blue = utils.get_highlight("Function").fg,
--   gray = utils.get_highlight("NonText").fg,
--   orange = utils.get_highlight("Constant").fg,
--   purple = utils.get_highlight("Statement").fg,
--   cyan = utils.get_highlight("Special").fg,
--   diag_warn = utils.get_highlight("DiagnosticWarn").fg,
--   diag_error = utils.get_highlight("DiagnosticError").fg,
--   diag_hint = utils.get_highlight("DiagnosticHint").fg,
--   diag_info = utils.get_highlight("DiagnosticInfo").fg,
--   git_del = utils.get_highlight("diffDeleted").fg,
--   git_add = utils.get_highlight("diffAdded").fg,
--   git_change = utils.get_highlight("diffChanged").fg,
-- }

local sbar_icon = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
-- Another variant, because the more choice the better.
-- local sbar_icon = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }

-- 文件图标
local FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self) return self.icon and (self.icon .. " ") end,
  hl = function(self) return { fg = self.icon_color } end,
}

-- tabline buffer 下标
local TablineBufnr = {
  provider = function(self) return tostring(self.bufnr) .. ". " end,
  hl = "Comment",
}

-- tabline 文件名
local TablineFileName = {
  provider = function(self)
    -- self.filename will be defined later, just keep looking at the example!
    local filename = self.filename
    filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
    return filename
  end,
  hl = function(self) return { bold = self.is_active or self.is_visible, italic = true } end,
}

-- tabline 标志
local TablineFileFlags = {
  {
    condition = function(self) return vim.api.nvim_get_option_value("modified", { buf = self.bufnr }) end,
    provider = "[+]",
    hl = { fg = "green" },
  },
  {
    condition = function(self)
      return not vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
        or vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
    end,
    provider = function(self)
      if vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) == "terminal" then
        return "  "
      else
        return ""
      end
    end,
    hl = { fg = "orange" },
  },
}

-- tabline 文件名块
local TablineFileNameBlock = {
  init = function(self) self.filename = vim.api.nvim_buf_get_name(self.bufnr) end,
  hl = function(self)
    if self.is_active then
      return "TabLineSel"
    -- why not?
    -- elseif not vim.api.nvim_buf_is_loaded(self.bufnr) then
    --     return { fg = "gray" }
    else
      return "TabLine"
    end
  end,
  on_click = {
    callback = function(_, minwid, _, button)
      if button == "m" then -- close on mouse middle click
        vim.schedule(function() vim.api.nvim_buf_delete(minwid, { force = false }) end)
      else
        vim.api.nvim_win_set_buf(0, minwid)
      end
    end,
    minwid = function(self) return self.bufnr end,
    name = "heirline_tabline_buffer_callback",
  },
  TablineBufnr,
  FileIcon, -- turns out the version defined in #crash-course-part-ii-filename-and-friends can be reutilized as is here!
  TablineFileName,
  TablineFileFlags,
}

-- a nice "x" button to close the buffer
local TablineCloseButton = {
  condition = function(self) return not vim.api.nvim_get_option_value("modified", { buf = self.bufnr }) end,
  { provider = " " },
  {
    provider = "",
    hl = { fg = "gray" },
    on_click = {
      callback = function(_, minwid)
        vim.schedule(function()
          vim.api.nvim_buf_delete(minwid, { force = false })
          vim.cmd.redrawtabline()
        end)
      end,
      minwid = function(self) return self.bufnr end,
      name = "heirline_tabline_close_buffer_callback",
    },
  },
}

-- 最后的触摸！
local TablineBufferBlock = utils.surround({ "", "" }, function(self)
  if self.is_active then
    return utils.get_highlight("TabLineSel").bg
  else
    return utils.get_highlight("TabLine").bg
  end
end, { TablineFileNameBlock, TablineCloseButton })

-- 一个默认的获取缓冲区的函数
local get_bufs = function()
  return vim.tbl_filter(
    function(bufnr) return vim.api.nvim_get_option_value("buflisted", { buf = bufnr }) end,
    vim.api.nvim_list_bufs()
  )
end

-- 一个缓冲区列表的缓存
local buflist_cache = {}

-- 注册一个自动命令，每次添加/删除缓冲区时都会更新 buflist_cache
vim.api.nvim_create_autocmd({ "VimEnter", "UIEnter", "BufAdd", "BufDelete" }, {
  callback = function()
    vim.schedule(function()
      local buffers = get_bufs()
      for i, v in ipairs(buffers) do
        buflist_cache[i] = v
      end
      for i = #buffers + 1, #buflist_cache do
        buflist_cache[i] = nil
      end

      -- check how many buffers we have and set showtabline accordingly
      if #buflist_cache > 1 then
        vim.o.showtabline = 2 -- always
      elseif vim.o.showtabline ~= 1 then -- don't reset the option if it's already at default value
        vim.o.showtabline = 1 -- only when #tabpages > 1
      end
    end)
  end,
})

local BufferLine = utils.make_buflist(
  TablineBufferBlock,
  { provider = "", hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
  { provider = "", hl = { fg = "gray" } }, -- right truncation, also optional (defaults to ...... yep, ">")
  -- by the way, open a lot of buffers and try clicking them ;)
  -- out buf_func simply returns the buflist_cache
  function() return buflist_cache end,
  -- no cache, as we're handling everything ourselves
  false
)

local TablinePicker = {
  condition = function(self) return self._show_picker end,
  init = function(self)
    local bufname = vim.api.nvim_buf_get_name(self.bufnr)
    bufname = vim.fn.fnamemodify(bufname, ":t")
    local label = bufname:sub(1, 1)
    local i = 2
    while self._picker_labels[label] do
      if i > #bufname then break end
      label = bufname:sub(i, i)
      i = i + 1
    end
    self._picker_labels[label] = self.bufnr
    self.label = label
  end,
  provider = function(self) return self.label end,
  hl = { fg = "red", bold = true },
}

vim.keymap.set("n", "gbp", function()
  local tabline = require("heirline").tabline
  local buflist = tabline._buflist[1]
  buflist._picker_labels = {}
  buflist._show_picker = true
  vim.cmd.redrawtabline()
  local char = vim.fn.getcharstr()
  local bufnr = buflist._picker_labels[char]
  if bufnr then vim.api.nvim_win_set_buf(0, bufnr) end
  buflist._show_picker = false
  vim.cmd.redrawtabline()
end)

local Tabpage = {
  provider = function(self) return "%" .. self.tabnr .. "T " .. self.tabpage .. " %T" end,
  hl = function(self)
    if not self.is_active then
      return "TabLine"
    else
      return "TabLineSel"
    end
  end,
}

local TabpageClose = {
  provider = "%999X  %X",
  hl = "TabLine",
}

local TabPages = {
  -- only show this component if there's 2 or more tabpages
  condition = function() return #vim.api.nvim_list_tabpages() >= 2 end,
  { provider = "%=" },
  utils.make_tablist(Tabpage),
  TabpageClose,
}

local TabLineOffset = {
  condition = function(self)
    local win = vim.api.nvim_tabpage_list_wins(0)[1]
    local bufnr = vim.api.nvim_win_get_buf(win)
    self.winid = win

    if vim.bo[bufnr].filetype == "NvimTree" then
      self.title = "NvimTree"
      return true
      -- elseif vim.bo[bufnr].filetype == "TagBar" then
      --     ...
    end
  end,

  provider = function(self)
    local title = self.title
    local width = vim.api.nvim_win_get_width(self.winid)
    local pad = math.ceil((width - #title) / 2)
    return string.rep(" ", pad) .. title .. string.rep(" ", pad)
  end,

  hl = function(self)
    if vim.api.nvim_get_current_win() == self.winid then
      return "TablineSel"
    else
      return "Tabline"
    end
  end,
}

local TabLine = { TabLineOffset, BufferLine, TabPages }

-- Yep, with heirline we're driving manual!
vim.o.showtabline = 2
vim.cmd [[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]]

return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      -- local c = require("vscode.colors").get_colors()
      local colors = {} --require("highlight.init").set_highlights(c)
      -- 在每个窗口顶部显示 winbar (显示光标所在位置的函数层级)
      opts.winbar = { -- create custom winbar
        -- store the current buffer number
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        fallthrough = false, -- pick the correct winbar based on condition
        -- inactive winbar
        {
          condition = function() return not status.condition.is_active() end,
          -- show the path to the file relative to the working directory
          status.component.separated_path {
            path_func = status.provider.filename { modify = ":.:h" },
            separator = "\\",
          },
          -- add a section for the currently opened file information
          status.component.file_info {
            file_icon = false,
            filename = {},
            filetype = false,
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbar", true),
            surround = false,
            update = "BufEnter",
            padding = { left = 0, right = 0 },
          },
        },
        -- active winbar
        {
          -- 为当前文件添加一个组件，显示文件信息
          status.component.file_info { -- add file_info to breadcrumbs
            file_icon = false,
            filename = {},
            filetype = false,
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbar", true),
            surround = false,
            update = "BufEnter",
            padding = { left = 1, right = 0 },
          },
          -- 显示面包屑
          status.component.breadcrumbs {
            icon = { hl = true },
            hl = status.hl.get_attributes("winbar", true),
            prefix = true,
            padding = { left = 0 },
            separator = " > ",
          },
        },
      }

      -- 在底部显示状态栏
      opts.statusline = {
        -- default highlight for the entire statusline
        hl = { fg = "fg", bg = "bg" },
        -- each element following is a component in astroui.status module

        -- 模式
        status.component.mode {
          provider = function() return " " .. vim.fn.mode():sub(1, 1):upper() end,
          padding = { left = 0, right = 0 },
          surround = { separator = "none" },
        },

        -- 文件路径
        {
          -- 展示文件相对于工作目录的路径
          status.component.separated_path {
            path_func = function() return vim.fn.expand "%:.:h" end,
            separator = "\\",
            hl = { fg = "fg", bg = "file_info_bg" },
          },
          -- 添加一个部分，用于当前打开的文件名称和文件类型
          status.component.file_info {
            filename = {
              fname = function()
                local file = vim.fn.expand "%:t"
                -- 如果文件名包括"neo-tree filesystem"，返回"neo-tree"
                if string.len(file) == 0 then
                  return "function window"
                elseif string.match(file, "neo%-tree filesystem") ~= nil then
                  return "neo-tree"
                else
                  return file
                end
              end,
            },
            filetype = false,
            file_icon = false,
            file_read_only = false,
            padding = { right = 1 },
            surround = { separator = "none", condition = false },
          },
          -- 添加一个部分，用于显示当前文件的icon
          status.component.file_info {
            file_icon = {
              hl = status.hl.filetype_color,
              padding = { left = 1, right = 1 },
            },
            filename = false,
            filetype = false,
            file_modified = false,
            file_read_only = false,
            hl = { fg = "fg", bg = "bg" },
            surround = false,
            update = "BufEnter",
          },
        },

        -- git
        {
          status.component.git_branch {
            git_branch = { padding = { left = 0, right = 0 }, hl = { fg = "#21971b" } },
            surround = { separator = "none" },
          },
          status.component.git_diff {
            added = { padding = { left = 0, right = 0 }, hl = { fg = "#21971b" } },
            changed = { padding = { left = 0, right = 0 }, hl = { fg = "#cfa20a" } },
            removed = { padding = { left = 0, right = 0 }, hl = { fg = "#ff0000" } },
            surround = { separator = "none" },
          },
        },

        -- 如果存在，则为当前诊断添加一个组件，并使用正确的分隔符作为该部分
        status.component.diagnostics { surround = { separator = "none" } },

        -- 填充状态行的其余部分
        -- 此后的元素将出现在状态行的中间
        status.component.fill(),
        -- 添加一个组件来显示 LSP 是否正在加载、禁用显示正在运行的客户端名称，并且不使用分隔符
        status.component.lsp {
          lsp_client_names = false,
          surround = { separator = "none", color = "bg" },
        },
        -- 填充状态行的其余部分
        -- 此后的元素将出现在状态行的右侧
        status.component.fill(),
        -- 添加一个组件来显示 LSP 客户端，禁用显示 LSP 进度，并且不使用分隔符

        -- 使用provider自定义时无法显示由none-ls调用的外部LSP如prettier(会显示null-ls)
        -- {
        --   condition = conditions.lsp_attached,
        --   update = {
        --     'LspAttach',
        --     'LspDetach',
        --     "BufEnter",
        --     "FileType",
        --     "VimResized",
        --     callback = function() vim.schedule(vim.cmd.redrawstatus) end,
        --   },

        --   provider = function()
        --     local names = {}
        --     for i, server in pairs(vim.lsp.get_active_clients({})) do
        --       table.insert(names, server.name)
        --     end
        --     return " [" .. table.concat(names, " ") .. "]"
        --   end,
        -- },

        -- 显示启用的 LSP, 默认使用","分隔(没有发现修改方法)
        -- 使用provider自定义时无法显示由none-ls调用的外部LSP如prettier(会显示null-ls)
        status.component.lsp {
          -- condition = conditions.lsp_attached,
          -- update = {'LspAttach', 'LspDetach'},

          -- provider = function()
          --   local names = {}
          --   for i, server in pairs(vim.lsp.get_active_clients({})) do
          --     table.insert(names, server.name)
          --   end
          --   return " [" .. table.concat(names, " ") .. "]"
          -- end,

          padding = { left = 0, right = 1 },
          hl = { fg = "#11D7F0" },
          lsp_client_names = {
            -- provider = function()
            --   local a = ""
            --   return " " .. a
            -- end,
          },
          -- provider = require("lsp-status").status,
          lsp_progress = false,
          surround = { separator = "none" },
        },
        -- NvChad 有一些漂亮的图标来配合信息，所以我们可以创建一个父组件来执行此操作
        -- 该表的所有子项将被视为一个组件
        -- 项目根目录名
        {
          status.component.file_info {
            -- we only want filename to be used and we can change the fname
            -- function to get the current working directory name
            filename = {
              fname = function(nr) return vim.fn.getcwd(nr) end,
              padding = { left = 1, right = 1 },
            },
            -- disable all other elements of the file_info component
            filetype = false,
            file_icon = false,
            file_modified = false,
            file_read_only = false,
            -- use no separator for this part but define a background color
            surround = {
              separator = "none",
              color = "file_info_bg",
              condition = false,
            },
          },
        },
        -- the final component of the NvChad statusline is the navigation section
        -- this is very similar to the previous current working directory section with the icon
        {
          -- add a navigation component and just display the percentage of progress in the file
          status.component.nav {
            hl = { fg = "file_info_fg", bg = "file_info_bg" },
            -- add some padding for the percentage provider
            percentage = { padding = { left = 1, right = 1 } },
            -- disable all other providers
            ruler = {
              provider = false,
              padding = { left = 0, right = 0 },
            },
            scrollbar = false,
            -- use no separator and define the background color
            surround = { separator = "none", color = "file_info_bg" },
          },
          status.component.nav {
            hl = { fg = "#11D7F0", bg = "file_info_bg" },
            percentage = false,
            ruler = false,
            scrollbar = false,
            provider = function()
              local current_line = vim.api.nvim_win_get_cursor(0)[1]
              local total_lines = vim.api.nvim_buf_line_count(0)
              local proportion = math.floor(current_line / total_lines * 100)
              local bar = sbar_icon[math.floor(proportion / (100 / 7)) + 1]
              return bar .. bar
            end,
            surround = { separator = "none", color = "file_info_bg" },
          },
        },
      }

      -- -- 在每个窗口底部显示 tabline (显示所有打开的文件)
      -- opts.tabline = {
      --   status.component.tabline_file_info {

      --   },
      -- }

      local heirline = require "heirline"

      heirline.load_colors(colors)

      heirline.setup {
        -- statusline = StatusLines,
        -- winbar = WinBars,
        tabline = TabLine,
        opts = {
          colors = colros,
        },
      }
    end,
  },
}
