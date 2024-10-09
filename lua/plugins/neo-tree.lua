function restore_from_trash(state)
    local Path = require("plenary.path")
    local trash_files_output = vim.fn.systemlist("trash -l")

    if vim.v.shell_error ~= 0 then
        print("휴지통 파일 목록을 불러오는데 실패했습니다.")
        return
    end

    -- '#' is table length operator
    if #trash_files_output == 0 then
        print("휴지통이 비어있습니다.")
        return
    end

    vim.ui.select(trash_files_output, {
        prompt = "복원할 파일 선택: ",
    }, function(source_path)
        if not source_path then
            print("파일을 선택하지 않았습니다.")
            return
        end

        vim.ui.input({
            prompt = "복원할 경로 입력: ",
            default = vim.fn.fnamemodify(state.tree:get_node().path, ":h"),
            completion = "dir", -- 경로 자동 완성 기능 활성화
        }, function(input_path)
            if not input_path then
                print("복원할 경로 입력을 취소했습니다. 종료합니다.")
                return
            end

            local filename = vim.fn.fnamemodify(source_path, ":t")
            local target_path = Path:new(input_path, filename)

            local result = vim.fn.system({ "mv", tostring(source_path), tostring(target_path) })
            if vim.v.shell_error == 0 then
                print("파일이 성공적으로 복원되었습니다: " .. tostring(target_path))
            else
                print("복원 실패: " .. result)
            end
        end)
    end)
end

return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        { "<leader>e", "<leader>fE", desc = "Explorer NeoTree (Root Dir)", remap = true },
        { "<leader>E", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
    },
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
            },
            window = {
                mappings = {
                    ["s"] = "",
                    ["sv"] = "open_vsplit",
                    ["ss"] = "open_split",
                    ["R"] = "restore",
                },
            },

            commands = {
                delete = function(state)
                    local node = state.tree:get_node()
                    local path = node and node.path

                    if not path then
                        print("파일을 찾을 수 없습니다.")
                        return
                    end

                    local confirm =
                        vim.fn.confirm("정말로 파일을 삭제하시겠습니까? " .. path, "&Yes\n&No", 2)
                    if confirm ~= 1 then
                        return
                    end

                    local result = vim.fn.system({ "trash", path })
                    if vim.v.shell_error == 0 then
                        print("파일이 성공적으로 삭제되었습니다: " .. path)
                    else
                        print("삭제 실패: " .. result)
                    end
                end,
                restore = restore_from_trash,
            },
        },
    },
}
