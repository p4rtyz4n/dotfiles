local neotree = require("plugins.neo-tree")
neotree.opts = {
  filesystem = {
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
  },
}

return neotree
