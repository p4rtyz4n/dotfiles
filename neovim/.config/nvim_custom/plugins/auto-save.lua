return {
    "okuuva/auto-save.nvim",
    event = "VeryLazy",
    config = function()
    require("auto-save").setup({
        execution_message = { enabled = false },
        debounce_delay = 1000,
    })
    end,
}