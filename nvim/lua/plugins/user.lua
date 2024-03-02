---@type LazySpec
return {
  "ThePrimeagen/vim-be-good", --:VimBeGood
  "aznhe21/actions-preview.nvim",
  --override in community
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = "rust",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem = {
        filtered_items = {
          visible = false,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            ".git",
            ".DS_Store",
            ".idea",
            -- 'thumbs.db',
          },
          never_show = {},
        },
      }
    end,
  },
}
