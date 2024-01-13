return {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-treesitter/nvim-treesitter" },
    },
    opts = {
        ui = {
            winblend = 30,
        },
        scroll_preview = {
            scroll_down = "<C-d>",
            scroll_up = "<C-u>",
        },
        lightbulb = { enable = false },
        symbol_in_winbar = { enable = false },
    },
    keys = {
        { "gdp", "<cmd>Lspsaga peek_definition<cr>",                 desc = "Show the Definition preview" },
        {
            "gdf",
            "<cmd>Lspsaga lsp_finder<cr>",
            desc = "Show the Definition|Reference|Implementation preview",
        },
        { "K",   "<cmd>Lspsaga hover_doc<cr>",                       desc = "Hover symbol details" },
        { "gl",  "<cmd>Lspsaga show_line_diagnostics ++unfocus<cr>", desc = "Hover diagnostics" },

        -- Diagnostic jump with filters such as only jumping to an error
        { "]e",  "<cmd>Lspsaga diagnostic_jump_next<cr>",            desc = "Next diagnostic" },
        { "[e",  "<cmd>Lspsaga diagnostic_jump_prev<cr>",            desc = "Prev diagnostic" },
        {
            "]E",
            function() require("lspsaga.diagnostic"):goto_next { severity = vim.diagnostic.severity.ERROR } end,
            desc = "Next Error",
        },
        {
            "[E",
            function() require("lspsaga.diagnostic"):goto_prev { severity = vim.diagnostic.severity.ERROR } end,
            desc = "Prev Error",
        },
    },
}