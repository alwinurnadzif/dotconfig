local ls = require("luasnip")
local s, t, i = ls.snippet, ls.text_node, ls.insert_node

return {
	-- React Functional Component
	s("rfc", {
		t("export default function "),
		i(1, "ComponentName"),
		t("() {"),
		t({ "", "  return (" }),
		t({ "    <>" }),
		i(2),
		t({ "    </>" }),
		t({ "  );", "}" }),
	}),

	-- useState Hook
	s("us", {
		t("const ["),
		i(1, "state"),
		t(", set"),
		i(2, "State"),
		t("] = useState("),
		i(3, "initialValue"),
		t(");"),
	}),

	-- useEffect Hook
	s("ue", {
		t("useEffect(() => {"),
		i(1),
		t({ "", "}, [" }),
		i(2, "dependencies"),
		t({ "]);" }),
	}),

	-- map list JSX
	s("mapx", {
		t("{"),
		i(1, "items"),
		t(".map(("),
		i(2, "item"),
		t(", "),
		i(3, "index"),
		t(") => ("),
		t({ "  <div key={" }),
		i(3),
		t("}>"),
		t({ "    " }),
		i(2),
		t({ "  </div>", "))}" }),
	}),

	-- Console Log
	s("clg", {
		t("console.log("),
		i(1),
		t(");"),
	}),

	-- Try Catch
	s("tc", {
		t("try {"),
		i(1),
		t({ "", "} catch (error) {", "  " }),
		i(0),
		t({ "", "} finally {", "}" }),
	}),

	-- Next use client
	s("uc", {
		t('"use client"'),
	}),

	-- Export const
	s("ec", {
		t("export const "),
		i(1),
		t(" = "),
	}),

	s("ecf", {
		t("export const "),
		i(1),
		t(" = () => {"),
		i(0),
		t({ "", "}" }),
	}),

	-- Const function
	s("cf", {
		t("const "),
		i(1),
		t(" = () => {"),
		i(0),
		t({ "", "}" }),
	}),

	-- on click
	s("oc", {
		t("const "),
		t("handle"),
		i(1, "Click", nil, { user_args = {} }),
		t(" = (e) => {"),
		i(2),
		t({ "", "}" }),
	}),
}
