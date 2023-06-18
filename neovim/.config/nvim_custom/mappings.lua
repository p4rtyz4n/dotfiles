local M = {}

M.general = {
    n = {
        ["<Leader>l"] = { "<cmd>lua require('lsp_lines').toggle();<cr>",  "Toggle lsp_lines" },
    }
}

M.telescope = {
    n = {
        ["gd"] = { "<cmd>lua require('omnisharp_extended').telescope_lsp_definitions()<cr>", "Go to definition" },
        ["<Leader>nt"] = { function()
            require("neotest").run.run()
         end, "Run nearest test" },
    },
}

M.dap = {
    n = {
        ["<leader>db" ] = {
            "<emd> DapToggleBreakpoint <CR>",
            "Toggle breakpoint"
        },
        ["<leader>dus"] = {
            function ()
                local widgets = require("dap.ui.widgets");
                local sidebar = widgets.sidebar(widgets.scopes);
                sidebar.open();
            end,
            "Open debugging sidebar"
        }
    }
}

-- more keybinds!

return M