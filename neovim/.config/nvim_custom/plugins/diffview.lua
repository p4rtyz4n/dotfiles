return {
    "sindrets/diffview.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
    -- :h diffview-merge-tool
    -- :h :DiffviewFileHistory
    -- :DiffviewOpen, :DiffviewOpen origin/main...HEAD, :DiffviewOpen HEAD~4..HEAD~2
    -- :h diffview-config-keymaps
    -- :h diffview-actions
    config = function()
        require("diffview").setup()
    end,
}