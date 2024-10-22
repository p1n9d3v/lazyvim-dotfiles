return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        -- LazyVim의 기본 설정을 덮어씌우지 않고 vim.g 설정만 변경
        vim.g.lazygit_use_custom_config_file_path = 1
        vim.g.lazygit_config_file_path = "/Users/p1n9/.config/lazygit/config.yml"
    end,
    keys = {
        -- LazyGit 실행 시 설정 파일을 적용한 명령어로 키맵 오버라이드
        { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit (Root Dir)" },
        { "<leader>gG", "<cmd>LazyGit<cr>", desc = "LazyGit (cwd)" },
        { "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit Current File History" },
        { "<leader>gl", "<cmd>LazyGitFilter<cr>", desc = "LazyGit Log" },
        { "<leader>gL", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit Log (cwd)" },
    },
}
