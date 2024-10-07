vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- Prevent Mouse
vim.opt.mouse = ""

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Env
vim.env.LAZYGIT_CONFIG_FILE = "~/.config/lazygit/config.yml"
