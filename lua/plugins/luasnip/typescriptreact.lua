local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

ls.add_snippets("typescriptreact", {
    s("storybook", {
        t({ "import type { Meta, StoryObj } from '@storybook/react';", "" }),
        t({ "import " }),
        i(1, "Component"),
        t({ " from '" }),
        i(2, "path/to/component"),
        t({ "';", "" }),
        t({ "", "const meta = {", "    title: '" }),
        i(3, "PATH"),
        t({ "',", "" }),
        t({ "    component: " }),
        d(4, function(args)
            return sn(nil, t(args[1][1]))
        end, { 1 }),
        t({
            ",",
            "    parameters: {",
            "        layout: 'centered',",
            "    },",
            "    tags: ['autodocs'],",
            "    argTypes: {},",
            "    args: {},",
            "} satisfies Meta<typeof ",
        }),
        d(5, function(args)
            return sn(nil, t(args[1][1]))
        end, { 1 }),
        t({
            ">;",
            "",
            "export default meta;",
            "type Story = StoryObj<typeof meta>;",
            "",
            "export const Default: Story = {",
            "    args: {},",
            "};",
        }),
    }),
})

ls.add_snippets("typescriptreact", {
    s("rvc", {
        t({ "type " }),
        i(1, "Component"),
        t({ "Props = {};", "", "" }),
        t({ "const " }),
        d(2, function(args)
            return sn(nil, t(args[1][1]))
        end, { 1 }),
        t({ " = () => {", "    return <div>" }),
        d(3, function(args)
            return sn(nil, t(args[1][1]))
        end, { 1 }),
        t({ "</div>;", "};", "", "export default " }),
        d(4, function(args)
            return sn(nil, t(args[1][1]))
        end, { 1 }),
        t({ ";" }),
    }),
})
