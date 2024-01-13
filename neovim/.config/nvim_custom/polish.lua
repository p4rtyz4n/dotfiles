
return function()
    local augroup = vim.api.nvim_create_augroup
    local cmd = vim.api.nvim_create_autocmd
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

end