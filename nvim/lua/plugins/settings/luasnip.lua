local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

local extras = require("luasnip.extras")

local s = ls.s
local t = ls.text_node
local i = ls.insert_node
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("all", {
	s("tern", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		i(1, "cond"),
		t(" ? "),
		i(2, "then"),
		t(" : "),
		i(3, "else"),
	}),
	s("c", t("// ")),
	s("nc", { t("// NOCOMMIT - "), i(0) }),
	s(
		"cm",
		fmt(
			[[
	/**
	* {}
	*/
	]],
			{ i(0) }
		)
	),
})

ls.add_snippets("php", {
	s(
		"groupn",
		fmt(
			[[
	/**
	* @group {}
	*/
	]],
			{ i(0) }
		)
	),
	s(
		"lg",
		fmt(
			[[
	// NOCOMMIT - {}
	\Log::debug('amjerm {}' . __METHOD__ . ':' . __LINE__, [{}]);
	]],
			{ i(0, "reason"), i(2, "label"), i(1, "data") }
		)
	),
	s(
		"f",
		fmt(
			[[
	// NOCOMMIT - comment
	{restriction} function {name}({args}){returns}
	{{
		// NOCOMMIT - test me
		// NOCOMMIT - do something
		{content}
	}}
	]],
			{
				restriction = i(1, "public"),
				name = i(2, "funcName"),
				args = i(3),
				returns = i(4),
				content = i(0),
			}
		)
	),
	s(
		"constr",
		fmt(
			[[
	public function __construct({args})
	{{
		{content}
	}}
	]],
			{
				args = i(3),
				content = i(0),
			}
		)
	),
	s(
		"try",
		fmt(
			[[
			try {
				<try>
			} catch (<exception> $e) {
				<catch>
			}
		]],
			{
				exception = i(1, "\\Exception"),
				catch = i(2, "Log::debug(__METHOD__ . ':' . __LINE__, [$e]);"),
				try = i(0),
			},
			{ delimiters = "<>" }
		)
	),
	s(
		"this",
		fmt(
			[[
			$this->{prop} = ${var};
	]],
			{
				prop = i(1, "property"),
				var = rep(1),
			}
		)
	),
	s(
		"cl",
		fmt(
			[[
		<?php

		namespace Tsi\{namespace}

		class {class_name}
		{{
			{content}
		}}
		]],
			{
				namespace = i(2),
				class_name = i(1),
				content = i(0),
			}
		)
	),
	s(
		"prov",
		fmt(
			[[
		/**
		* @dataProvider {provider}
		*/
		]],
			{
				provider = i(0),
			}
		)
	),
})

ls.add_snippets("typescriptreact", {
	s(
		"rc",
		fmt(
			[[
interface Props {{
	{propDef}
}}
const {name} = ({props}: Props) => {{
    return (
    <p>{text}{e}</p>
    )
}}
export default {export}
	]],
			{
				name = i(1),
				propDef = i(2),
				props = i(3),
				text = rep(1),
				export = rep(1),
				e = i(0),
			}
		)
	),
	s(
		"lg",
		fmt(
			[[
	// NOCOMMIT
	console.log('amjerm - {label}', {data})
	]],
			{
				label = i(1),
				data = i(0),
			}
		)
	),
	s(
		"try",
		fmt(
			[[
			try {
				<try>
			} catch (err) {
				<catch>
			}
		]],
			{
				catch = i(1, "console.error(err)"),
				try = i(0),
			},
			{ delimiters = "<>" }
		)
	),
	s(
		"state",
		fmt(
			[[
	    const [{}, {}] = useState<{}>({})
	]],
			{ i(1), i(2), i(3), i(4) }
		)
	),
})
