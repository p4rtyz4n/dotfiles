local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "json",
    "bash",
    "c_sharp",
    "diff",
    "dockerfile",
    "rust",
    "yaml",
    "sql"
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",

    "bash-language-server",
    "dockerfile-language-server",
    "json-lsp",
    "omnisharp",
    "rust-analyzer",
    "rustfmt",
    "yaml-language-server",
    "fantomas",
    --eslint-lsp
    --eslint_d
    -- shell
    "shfmt",
    "shellcheck",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M