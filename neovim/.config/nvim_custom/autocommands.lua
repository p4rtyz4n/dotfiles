
local augroup = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd


-- Fixes some bugs with how treesitter manages folds
cmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
    desc = "fix tree sitter folds issue",
    group = augroup("treesitter folds", { clear = true }),
    pattern = { "*" },
    callback = function()
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end,
})


-- Fixes issues that arise when using the autosave plugin and autoformatting at the same time

supports_formatting = function()
	local clients = vim.lsp.get_active_clients()
	for _, client in ipairs(clients) do
		if client.supports_method("textDocument/formatting") then
			return true
		end
	end
	return false
end

cmd("User", {
    desc = "stops format->write loop and joins format change with last user change when undoing",
    pattern = "AutoSaveWritePre",
    group = augroup("auto save", { clear = true }),
    callback = function()
    if supports_formatting() then
        vim.api.nvim_buf_create_user_command(0, "Format", function()
        vim.lsp.buf.format()
        end, {})
        vim.cmd("silent! undojoin")
        vim.cmd("Format")
    end
    end,
})

-- remembers file state, such as cursor position and any folds
augroup("remember file state", { clear = true })
cmd({ "BufWinLeave" }, {
    desc = "remember file state",
    group = "remember file state",
    pattern = { "*.*" },
    command = "mkview",
})
cmd({ "BufWinEnter" }, {
    desc = "remember file state",
    group = "remember file state",
    pattern = { "*.*" },
    command = "silent! loadview",
})