return function()
  local fzf_lua = require('fzf-lua')
  fzf_lua.setup({
    winopts = {
      fullscreen = true,
    }
  })

  local function get_git_root()
    -- Get the directory of the current file
    local file_dir = vim.fn.expand('%:p:h')
    local git_root = vim.fn.systemlist('git -C ' .. vim.fn.shellescape(file_dir) .. ' rev-parse --show-toplevel')
    if vim.v.shell_error ~= 0 or #git_root == 0 then
      vim.notify("Error: Not in a Git repository", vim.log.levels.ERROR)
    end
    -- Return the Git root directory (first line of output)
    return git_root[1]
  end

  vim.keymap.set('n', '<C-p>', fzf_lua.git_files, { desc = 'Find files tracked in git repo' })

  vim.keymap.set('n', '<leader>f', function()
    fzf_lua.files({
      -- for some reason, the builtin fzf command doesn't show hidden files
      cmd = "rg --files --hidden --glob '!.git'",
      cwd = get_git_root(),
    })
  end, { desc = 'Find files git root' })

  vim.keymap.set('n', '<leader>r', function()
    fzf_lua.grep({cwd = get_git_root()})
  end)
  vim.keymap.set('n', '<leader>l', function()
    fzf_lua.live_grep({cwd = get_git_root()})
  end)
  vim.keymap.set('n', '<leader>c', fzf_lua.git_commits)
  vim.keymap.set('n', '<leader>bf', fzf_lua.buffers)
end
