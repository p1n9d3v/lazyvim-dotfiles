return {
    {
        "nvim-neotest/neotest",
        dependencies = { "nvim-neotest/neotest-jest", "marilari88/neotest-vitest" },
        opts = function(_, opts)
            opts.adapters = {
                require("neotest-jest"),
                require("neotest-vitest")({
                    vitestCommand = "pnpm run test",
                    cwd = function(path)
                        -- 'package.json' 파일을 찾고 해당 디렉토리를 루트로 설정
                        local package_root = vim.fn.findfile("package.json", vim.fn.fnamemodify(path, ":p:h") .. ";")
                        if package_root ~= "" then
                            return vim.fn.fnamemodify(package_root, ":p:h")
                        else
                            return vim.fn.getcwd() -- 기본적으로 현재 디렉토리 사용
                        end
                    end,
                }),
            }
        end,
    },
}
