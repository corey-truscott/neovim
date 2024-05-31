-- snippets
-- require("luasnip.session.snippet_collection").clear_snippets "python"

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("python", {
    s("ifm", fmt('def main():\n\t{}\n\nif __name__ == "__main__":\n\tmain()', { i(1, "assert False") })),
    -- produces this:
    -- def main():
    --     {$1 assert False}
    --
    -- if __name__ == "__main__":
    --     main()
})
