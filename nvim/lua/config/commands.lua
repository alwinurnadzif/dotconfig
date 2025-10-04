vim.api.nvim_create_user_command("W", function()
	local buffers = vim.api.nvim_list_bufs()
	for _, buf in ipairs(buffers) do
		if
			vim.api.nvim_buf_is_valid(buf)
			and vim.api.nvim_buf_get_option(buf, "buflisted")
			and vim.api.nvim_buf_get_option(buf, "filetype") ~= "neo-tree"
		then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end, { desc = "Close all buffers except neo-tree" })
