return {
  n = {
    ["gy"] = { '"+y', desc = "Copy to system clipboard" },
    ["gp"] = { '"+p', desc = "Paste from system clipboard" },
  },
  v = {
    ["gy"] = { '"+y', desc = "Copy to system clipboard" },
    ["gp"] = { '"+p', desc = "Paste from system clipboard" },
  },
}
--[[
M.general = {
    n = {

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
]]
--
