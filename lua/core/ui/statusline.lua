local M = {}

local git_symbols = require("core.ui.symbols").git()

---@return string
M.lsp_clients = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    if next(clients) == nil then
        return ""
    end

    local c = {}
    for _, client in pairs(clients) do
        table.insert(c, client.name)
    end

    return "\u{f085}  " .. table.concat(c, "|")
end

---@return string
M.active_macro_register = function()
    if vim.fn.reg_recording() ~= "" then
        return "recording @" .. vim.fn.reg_recording()
    else
        return ""
    end
end

local mode_map = {
    ["n"] = "NORMAL",
    ["no"] = "OP-PENDING",
    ["nov"] = "OP-PENDING",
    ["noV"] = "OP-PENDING",
    ["no\22"] = "OP-PENDING",
    ["niI"] = "NORMAL",
    ["niR"] = "NORMAL",
    ["niV"] = "NORMAL",
    ["nt"] = "NORMAL",
    ["ntT"] = "NORMAL",
    ["v"] = "VISUAL",
    ["vs"] = "VISUAL",
    ["V"] = "VISUAL",
    ["Vs"] = "VISUAL",
    ["\22"] = "VISUAL",
    ["\22s"] = "VISUAL",
    ["s"] = "SELECT",
    ["S"] = "SELECT",
    ["\19"] = "SELECT",
    ["i"] = "INSERT",
    ["ic"] = "INSERT",
    ["ix"] = "INSERT",
    ["R"] = "REPLACE",
    ["Rc"] = "REPLACE",
    ["Rx"] = "REPLACE",
    ["Rv"] = "VIRT REPLACE",
    ["Rvc"] = "VIRT REPLACE",
    ["Rvx"] = "VIRT REPLACE",
    ["c"] = "COMMAND",
    ["cv"] = "VIM EX",
    ["ce"] = "EX",
    ["r"] = "PROMPT",
    ["rm"] = "MORE",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERMINAL",
}

M.mode = function()
    -- Get the respective string to display.
    local mode = mode_map[vim.api.nvim_get_mode().mode] or "UNKNOWN"

    -- -- Set the highlight group.
    -- local hl = "Other"
    -- if mode:find("NORMAL") then
    --     hl = "Normal"
    -- elseif mode:find("PENDING") then
    --     hl = "Pending"
    -- elseif mode:find("VISUAL") then
    --     hl = "Visual"
    -- elseif mode:find("INSERT") or mode:find("SELECT") then
    --     hl = "Insert"
    -- elseif mode:find("COMMAND") or mode:find("TERMINAL") or mode:find("EX") then
    --     hl = "Command"
    -- end
    -- string.format('%%#StatuslineModeSeparator%s#', hl),

    -- Construct the bubble-like component.
    -- return mode
    -- return table.concat({
    --     string.format("%%#StatuslineModeSeparator%s#", hl),
    --     string.format("%%#StatuslineMode%s#%s", hl, mode),
    --     string.format("%%#StatuslineModeSeparator%s#", hl),
    -- })

    return table.concat({
        string.format("%%#StatuslineModeSeparator#"),
        string.format("%%#StatuslineMode#%s", mode),
        string.format("%%#StatuslineModeSeparator#"),
    })
    -- return
end

M.diagnostics = function()
    local ok = "(󰄬)"

    local ignore = {
        ["c"] = true, -- command mode
        ["t"] = true, -- terminal mode
    }

    local mode = vim.api.nvim_get_mode().mode

    if ignore[mode] then
        return ok
    end

    local levels = vim.diagnostic.severity
    local errors = #vim.diagnostic.get(0, { severity = levels.ERROR })
    local warnings = #vim.diagnostic.get(0, { severity = levels.WARN })

    if errors > 0 and warnings > 0 then
        return string.format("(%d ✘) (%d )", errors, warnings)
    elseif errors > 0 then
        return string.format("(%d ✘)", errors)
    elseif warnings > 0 then
        return string.format("(%d )", warnings)
    end

    return ok
end

M.render = function()
    return table.concat({
        "",
        "%{%v:lua.require'core.ui.statusline'.mode()%}",
        git_symbols.Branch,
        "%{%v:lua.require'core.extensions.git'.branch_name()%}",
        "%{%v:lua.require'core.ui.statusline'.diagnostics()%}",
        "%=",
        "%{%v:lua.require'core.ui.statusline'.active_macro_register()%}",
        "",
        "%{%v:lua.require'core.ui.statusline'.lsp_clients()%}",
        "",
        "%l:%c",
        "",
    }, " ")
end

M.setup = function()
    vim.opt.laststatus = 2
    vim.opt.statusline = "%{%v:lua.require'core.ui.statusline'.render()%}"
end

return M
