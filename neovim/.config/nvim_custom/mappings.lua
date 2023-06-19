local M = {}

M.general = {
    n = {
        ["<Leader>l"] = {
            function()
                require('lsp_lines').toggle()
            end,
            "Toggle lsp_lines"
        },
        ["<Leader>nt"] = {
            function()
                require("neotest").run.run()
            end,
            "Run nearest test"
        },
        ["<leader>tw"] = {
            function ()
                require('neotest').run.run({ jestCommand = 'jest --watch ' })
            end,
            "Jest watch"
        }
    }
}

M.telescope = {
    n = {
        ["gd"] = { "<cmd>lua require('omnisharp_extended').telescope_lsp_definitions()<cr>", "Go to definition" },
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

M.crates = {
    n = {
        ["<leader>rcu" ] = {
            function ()
                require("crates").Upgrade_all_crates()
            end,
            "Update crates"
        }
    }
}

-- more keybinds!

return M