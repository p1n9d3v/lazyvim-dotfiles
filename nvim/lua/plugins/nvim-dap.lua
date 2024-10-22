local based_languages = {
    "typescript",
    "javascript",
    "javascriptreact",
    "typescriptreact",
    "vue",
}

return {
    {
        "mfussenegger/nvim-dap",
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
            vscode.json_decode = function(str)
                return vim.json.decode(json.json_strip_comments(str))
            end

            -- Extends dap.configurations with entries read from .vscode/launch.json
            if vim.fn.filereadable(".vscode/launch.json") then
                vscode.load_launchjs()
            end

            local dap = require("dap")

            for _, language in ipairs(based_languages) do
                dap.configurations[language] = {
                    -- Debug single nodejs files
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Launch file",
                        program = "${file}",
                        cwd = vim.fn.getcwd(),
                        sourceMaps = true,
                    },
                    -- Debug nodejs processes (make sure to add --inspect when you run the process)
                    {
                        type = "pwa-node",
                        request = "attach",
                        name = "Attach",
                        processId = require("dap.utils").pick_process,
                        cwd = vim.fn.getcwd(),
                        sourceMaps = true,
                    },
                    -- Debug web applications (client side)
                    {
                        type = "pwa-chrome",
                        request = "launch",
                        name = "Launch & Debug Chrome",
                        url = function()
                            local co = coroutine.running()
                            return coroutine.create(function()
                                vim.ui.input({
                                    prompt = "Enter URL: ",
                                    default = "http://localhost:3000",
                                }, function(url)
                                    if url == nil or url == "" then
                                        return
                                    else
                                        coroutine.resume(co, url)
                                    end
                                end)
                            end)
                        end,
                        webRoot = "${workspaceFolder}",
                        -- webRoot = vim.fn.getcwd(),
                        protocol = "inspector",
                        sourceMaps = true,
                        userDataDir = false,
                        -- userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
                    },
                    -- Divider for the launch.json derived configs
                    {
                        name = "----- ↓ launch.json configs ↓ -----",
                        type = "",
                        request = "launch",
                    },
                }
            end
        end,
        dependencies = {
            -- Install the vscode-js-debug adapter
            {
                "microsoft/vscode-js-debug",
                opt = true,
                run = "pnpm install --shamefully-hoist && pnpm exec gulp vsDebugServerBundle && mv dist out",
            },
            {
                "mxsdev/nvim-dap-vscode-js",
                config = function()
                    ---@diagnostic disable-next-line: missing-fields
                    require("dap-vscode-js").setup({
                        -- Path of node executable. Defaults to $NODE_PATH, and then "node"
                        -- node_path = "node",

                        -- Path to vscode-js-debug installation.
                        debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

                        -- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
                        -- debugger_cmd = { "js-debug-adapter" },

                        -- which adapters to register in nvim-dap
                        adapters = {
                            "chrome",
                            "pwa-node",
                            "pwa-chrome",
                            "pwa-msedge",
                            "pwa-extensionHost",
                            "node-terminal",
                        },

                        -- Path for file logging
                        -- log_file_path = "(stdpath cache)/dap_vscode_js.log",

                        -- Logging level for output to file. Set to false to disable logging.
                        -- log_file_level = false,

                        -- Logging level for output to console. Set to false to disable console output.
                        -- log_console_level = vim.log.levels.ERROR,
                    })
                end,
            },
        },
    },
}
