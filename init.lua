-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- 设置光标的颜色默认为拉姆的发(fà)色
vim.cmd "highlight Cursor gui=NONE guifg=bg guibg=#ffb6c1"
vim.cmd "highlight iCursor gui=NONE guifg=bg guibg=#56E0E0"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

if vim.g.neovide then
  -- 字体
  vim.o.guifont = "NotoMono Nerd Font Mono:h11"
  -- 行间距
  vim.opt.linespace = 4
  -- 透明度
  vim.g.neovide_transparency = 0.8
  -- 窗口模糊(仅限macOS)
  vim.g.neovide_window_blurred = true
  -- 浮动模糊量
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  -- 空闲刷新率
  vim.g.neovide_refresh_rate_idle = 5
  -- 记住上一个窗口大小
  vim.g.neovide_remember_window_size = true
else
  -- 背景色
  vim.cmd "set background=dark"
end

require "lazy_setup"
require "polish"

-- vim.cmd [[
--   augroup Alpha
--     autocmd!
--     autocmd VimEnter * ++nested lua require('alpha').start()
--   augroup END
-- ]]

-- require("alpha").start()
