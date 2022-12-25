local M = {}

M.general = {
    n = {
        ["<Leader>l"] = { "<cmd>lua require('lsp_lines').toggle();<cr>",  "Toggle lsp_lines" },
    }
}

M.telescope = {
    n = {
        ["gd"] = { "<cmd>lua require('omnisharp_extended').telescope_lsp_definitions()<cr>", "Go to definition" },
    },
}

-- more keybinds!

return M