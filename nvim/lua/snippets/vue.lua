local ls = require("luasnip")
local s, t, i = ls.snippet, ls.text_node, ls.insert_node
local rep = require("luasnip.extras").rep

return {
	s("vp", {
		t({ "<template>", "" }),
		i(0),
		t({ "</template>", "" }),
		t({ "", "<script setup></script>" }),
	}),
}
