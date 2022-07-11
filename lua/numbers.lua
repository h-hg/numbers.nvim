local M = {}

M.opts = {
  excluded_filetypes = {
    startify = true,        -- mhinz/vim-startify
    dashboard = true,       -- glepnir/dashboard-nvim
    alpha = true,           -- goolord/alpha-nvim
    Outline = true,         -- simrat39/symbols-outline.nvim
    fugitive = true,        -- tpope/vim-fugitive
    packer = true,          -- wbthomason/packer.nvim
    NvimTree = true,        -- kyazdani42/nvim-tree.lua
    TelescopePrompt = true, -- nvim-telescope/telescope.nvim
  },
  excluded_buftyeps = {
    terminal = true,
  }
}

M.setup = function(opts)
  -- conifg
  opts = opts or {}
  if opts.excluded_filetypes then
    M.opts.excluded_filetypes = {}
    for _, v in pairs(opts.excluded_filetypes) do
      M.opts.excluded_filetypes[v] = true
    end
  end
  if opts.excluded_buftyeps then
    M.opts.excluded_buftyeps = {}
    for _, v in pairs(opts.excluded_buftyeps) do
      M.opts.excluded_buftyeps[v] = true
    end
  end
  -- set number
  M.rnu()
end

M.rnu = function()
  vim.api.nvim_create_augroup('SmartRnu', {clear=true})

  -- norelative: leave, insert mode
  vim.api.nvim_create_autocmd({ 'WinLeave', 'FocusLost', 'InsertEnter' }, {
    group = 'SmartRnu',
    callback = function()
      if M.opts.excluded_filetypes[vim.o.filetype] or M.opts.excluded_buftyeps[vim.o.buftype] then
        return
      end
      vim.wo.rnu = false
    end,
  })
  
  -- relative
  vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave' }, {
    group = 'SmartRnu',
    callback = function()
      if M.opts.excluded_filetypes[vim.o.filetype] or M.opts.excluded_buftyeps[vim.o.buftype] then
        return
      end
      vim.wo.rnu = true
    end,
  })
  -- Enter
  vim.api.nvim_create_autocmd({ 'WinEnter', 'FocusGained'}, {
    group = 'SmartRnu',
    callback = function()
      if M.opts.excluded_filetypes[vim.o.filetype] or M.opts.excluded_buftyeps[vim.o.buftype] then
        return
      end
      if vim.fn.mode() == 'i' then
        vim.wo.rnu = false
      else
        vim.wo.rnu = true
      end
    end,
  })

end

return M