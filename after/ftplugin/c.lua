-- require("luasnip.session.snippet_collection").clear_snippets "c"

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("c", {
    s(
        "m",
        fmt(
            [[
int main(int argc, char **argv) {{
    {}
    return 0;
}}
]],
            { i(1, "// main") }
        )
    ),
    -- produces this:
    -- int main(int argc, char *argv[]) {
    --     // main
    --     return 0;
    -- }
})
