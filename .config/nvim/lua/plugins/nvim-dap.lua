return {
    "mfussenegger/nvim-dap",
    keys = {
        {
            "<leader>do",
            function()
                require("dap").step_over()
            end,
            desc = "Step Over",
        },
        {
            "<leader>dO",
            function()
                require("dap").step_out()
            end,
            desc = "Step Out",
        },
    },
    config = function()
        if LazyVim.has("mason-nvim-dap.nvim") then
            require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
        end

        vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

        for name, sign in pairs(LazyVim.config.icons.dap) do
            sign = type(sign) == "table" and sign or { sign }
            vim.fn.sign_define(
                "Dap" .. name,
                { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
            )
        end

        -- setup dap config by VsCode launch.json file
        local vscode = require("dap.ext.vscode")
        local json = require("plenary.json")
        ---@diagnostic disable-next-line: duplicate-set-field
        vscode.json_decode = function(str)
            return vim.json.decode(json.json_strip_comments(str))
        end

        local dap = require("dap")
        dap.adapters.chrome = {
            type = "executable",
            command = "node",
            args = { os.getenv("HOME") .. "/.config/nvim/debug/vscode-chrome-debug/out/src/chromeDebug.js" },
        }
        dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                -- 💀 Make sure to update this path to point to your installation
                args = { os.getenv("HOME") .. "/.config/nvim/debug/js-debug/src/dapDebugServer.js", "${port}" },
            },
        }
    end,
}
