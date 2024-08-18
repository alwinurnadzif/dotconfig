-- Define a custom command :W that closes all buffers
vim.api.nvim_create_user_command(
  'W',
  function()
    -- Close all buffers
    local buffers = vim.api.nvim_list_bufs()
    for _, buf in ipairs(buffers) do
      if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, 'buflisted') then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end,
  { desc = 'Close all buffers' }
)
