vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.g.colors_name = "cls"

local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Line Number
hi("LineNr", {
	ctermfg = 8,
})

hi("CursorLineNr", {
	ctermfg = 6,
	bold = true,
})

hi("lCursor", { ctermbg = 2 })
hi("lCursor", { ctermfg = 2 })

-- visual and search
hi("visual", { ctermbg = 6, ctermfg = 231 })

-- syntax
hi("Comment", { ctermfg = 8, italic = true })
