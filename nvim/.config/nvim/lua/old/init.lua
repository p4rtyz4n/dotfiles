return {
  lsp = {
    mappings = {
      n = {
        ["<leader>la"] = {
          function()
            require("actions-preview").code_actions()
          end,
          desc = "Code actions",
        },
      },
      v = {
        ["<leader>la"] = {
          function()
            require("actions-preview").code_actions()
          end,
          desc = "Code actions",
        },
      },
    },
  },
}
