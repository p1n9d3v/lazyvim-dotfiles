-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- ESC --
keymap.set("n", "<C-]>", function()
    vim.fn.feedkeys(":", "n") -- ':' 명령어 입력을 시뮬레이션
end, opts)

-- Increament and Decreament number

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "db", "vbd")

-- Jump list
keymap.set("n", "<C-m>", "<C-i>", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New Tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sl", "<C-w>l")
keymap.set("n", "sj", "<C-w>j")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Move Line
keymap.set("n", "<C-a>", "^", opts)
keymap.set("n", "<C-e>", "$", opts)

keymap.set("v", "<C-a>", "^", opts)
keymap.set("v", "<C-e>", "$", opts)

-- Visual Line
keymap.set("n", "<S-l>", "vg_", opts)
keymap.set("n", "<S-h>", "v_", opts)

-- Diagnostics
keymap.set("n", "<leader>xj", function()
    vim.diagnostic.goto_next()
end, {
    desc = "Jump to next diagnostic",
    noremap = true,
    silent = true,
})

keymap.set("n", "<leader>xk", function()
    vim.diagnostic.goto_prev()
end, {
    desc = "Jump to previous diagnostic",
    noremap = true,
    silent = true,
})

-- Multi Cursor
keymap.set("n", "<C-j>", "<Plug>(VM-Add-Cursor-Down)", opts)
keymap.set("n", "<C-k>", "<Plug>(VM-Add-Cursor-Up)", opts)

-- cmdline
keymap.set("c", "<C-j>", 'pumvisible() ? "<C-n>" : "<C-j>"', { expr = true, noremap = true })
keymap.set("c", "<C-k>", 'pumvisible() ? "<C-p>" : "<C-k>"', { expr = true, noremap = true })
