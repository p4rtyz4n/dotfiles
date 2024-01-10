-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- hybrid line numbers
vim.opt.number = true
vim.opt.relativenumber = true

require("custom.autocommands")