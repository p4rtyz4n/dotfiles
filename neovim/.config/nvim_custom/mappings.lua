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
    }
}

M.dap = {
    n = {
        ["<leader>db" ] = {
            "<emd> DapToggleBreakpoint <CR>",
            "Toggle breakpoint"
        },
        ["<leader>dus"] = {
            function ()
                local widgets = require("dap.ui.widgets")
                local sidebar = widgets.sidebar(widgets.scopes)
                sidebar.open();
            end,
            "Open debugging sidebar"
        },
        ["<leader>dui"] = {
            function ()
                local dapui = require("dapui")
                dapui.toggle()
            end,
            "Open debugging UI"
        },

        ['<F5>'] = {
            function ()
                local dapui = require("dapui")
                dapui.continue()
            end,
            "Continue debugging"
        },
        ["<F10>"] = {
            function ()
                local dapui = require("dapui")
                dapui.step_over()
            end,
            "Step over debugging"
        },
        ["<F11>"] = {
            function ()
                local dapui = require("dapui")
                dapui.step_into()
            end,
            "Step into debugging"
        },
        ["<F12>"] = {
            function ()
                local dapui = require("dapui")
                dapui.step_out()
            end,
            "Step out debugging"
        }
        --vim.keymap.set('n', "<leader>b"], require 'dap'.toggle_breakpoint)
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

M.ufo = {
    n = {
        ['zR'] = {
            function ()
                require('ufo').openAllFolds()
            end,
            "Open all folds"
        },
        ['zM'] = {
            function ()
                require('ufo').closeAllFolds()
            end,
            "Close all folds"
        },
    }
}

M.trouble = {
    n = {
      [ "<leader>xx" ] = {
        function ()
            require("trouble").toggle()
        end,
        "Toggle trouble"
      },
      [ "<leader>xw" ] = {
        function ()
            require("trouble").toggle("workspace_diagnostics")
        end,
        "Toggle workspace diagnostics"
      },
      [ "<leader>xd" ] = {
        function ()
            require("trouble").toggle("document_diagnostics")
        end,
        "Toggle document diagnostics"
      },
      [ "<leader>xq" ] = {
        function ()
            require("trouble").toggle("quickfix")
        end,
        "Toggle quickfix"
      },
      [ "<leader>xl" ] = {
        function ()
            require("trouble").toggle("loclist")
        end,
        "Toggle loclist"
      },
      [ "gR" ] = {
        function ()
            require("trouble").toggle("lsp_references")
        end,
        "Toggle lsp references"
      },
    }
}

M.aerial = {
    n = {
        ["<leader>a"] = { "<cmd>AerialToggle!<CR>", "Toggle Aerial" }
    }
}

return M