-- Add this to your init.lua or create a new file in your Neovim config directory

-- Function to format the current buffer with buildifier
local function format_buildifier()
    -- Get the current buffer number
    local bufnr = vim.api.nvim_get_current_buf()

    -- Create a temporary file with the current buffer contents
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local temp_file = os.tmpname()
    local temp_handle = io.open(temp_file, "w")

    if not temp_handle then
        vim.notify("Failed to create temporary file", vim.log.levels.ERROR)
        return
    end
    -- Save the cursor position
    local cursor_pos = vim.api.nvim_win_get_cursor(0)

    temp_handle:write(table.concat(lines, '\n'))
    temp_handle:close()

    -- Try to format the temp file
    local formatted = vim.fn.system(string.format("buildifier %s", vim.fn.shellescape(temp_file)))
    local exit_code = vim.v.shell_error
    if exit_code ~= 0 then
        os.remove(temp_file)
        -- Show error message if formatting failed
        vim.notify("Buildifier formatting failed: " .. formatted, vim.log.levels.ERROR)
        return
    end

    -- Read the formatted content
    local format_handle = io.open(temp_file, "r")
    if not format_handle then
        vim.notify("Failed to read formatted content from file: " .. temp_file, vim.log.levels.ERROR)
        os.remove(temp_file)
    end

    local content = format_handle:read("*all")
    format_handle:close()
    os.remove(temp_file)

    -- Update buffer with formatted content
    local formatted_lines = vim.split(content, '\n')
    -- Remove the last empty line if it exists
    if formatted_lines[#formatted_lines] == "" then
        table.remove(formatted_lines)
    end
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, formatted_lines)

    -- Restore cursor position
    vim.api.nvim_win_set_cursor(0, cursor_pos)
end

-- Create an autocommand group for buildifier
local buildifier_group = vim.api.nvim_create_augroup("BuildifierFormat", { clear = true })

-- Create autocmd to run formatter before save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = buildifier_group,
    pattern = {"BUILD", "WORKSPACE", "*.bzl", "*.starlark"},
    callback = format_buildifier,
    desc = "Auto-format Bazel files with buildifier before save using temp file"
})
