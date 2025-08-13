# Snippets with luasnip

From TjDvries videos and tutorials, creating a snipped which can be loaded with luasnip can be accomplished with the
following example:

```lua
-- create snippet
-- s(context, nodes, condition, ...)
local snippet = ls.s

-- TODO: Write about this.
--  Useful for dynamic nodes and choice nodes
local snippet_from_nodes = ls.sn

-- This is the simplest node.
--  Creates a new text node. Places cursor after node by default.
--  t { "this will be inserted" }
--
--  Multiple lines are by passing a table of strings.
--  t { "line 1", "line 2" }
local t = ls.text_node

-- Insert Node
--  Creates a location for the cursor to jump to.
--      Possible options to jump to are 1 - N
--      If you use 0, that's the final place to jump to.
--
--  To create placeholder text, pass it as the second argument
--      i(2, "this is placeholder text")
local i = ls.insert_node

-- Function Node
--  Takes a function that returns text
local f = ls.function_node

-- This a choice snippet. You can move through with <c-l> (in my config)
--   c(1, { t {"hello"}, t {"world"}, }),
--
-- The first argument is the jump position
-- The second argument is a table of possible nodes.
--  Note, one thing that's nice is you don't have to include
--  the jump position for nodes that normally require one (can be nil)
local c = ls.choice_node

local d = ls.dynamic_node

local events = require "luasnip.util.events"

-- local str_snip = function(trig, expanded)
--   return ls.parser.parse_snippet({ trig = trig }, expanded)
-- end

local same = function(index)
    return f(function(args)
        return args[1]
    end, { index })
end

local toexpand_count = 0

-- `all` key means for all filetypes.
-- Shared between all filetypes. Has lower priority than a particular ft tho
-- snippets.all = {
ls.add_snippets("all", {
    -- basic, don't need to know anything else
    --    arg 1: string
    --    arg 2: a node
    snippet("simple", t "wow, you were right!"),

    -- callbacks table
    snippet("toexpand", c(1, { t "hello", t "world", t "last" }), {
        callbacks = {
            [1] = {
                [events.enter] = function( --[[ node ]])
                    toexpand_count = toexpand_count + 1
                    print("Number of times entered:", toexpand_count)
                end,
            },
        },
    }),

    -- regTrig
    --    snippet.captures
    -- snippet({ trig = "AbstractGenerator.*Factory", regTrig = true }, { t "yo" }),

    -- third arg,
    snippet("never_expands", t "this will never expand, condition is false", {
        condition = function()
            return false
        end,
    }),

    -- docTrig ??

    -- functions

    -- date -> Tue 16 Nov 2021 09:43:49 AM EST
    snippet({ trig = "date" }, {
        f(function()
            return string.format(string.gsub(vim.bo.commentstring, "%%s", " %%s"), os.date())
        end, {}),
    }),

    -- Simple snippet, basics
    snippet("for", {
        t "for ",
        i(1, "k, v"),
        t " in ",
        i(2, "ipairs()"),
        t { "do", "  " },
        i(0),
        t { "", "" },
        t "end",
    }),

    --[[
        -- Alternative printf-like notation for defining snippets. It uses format
        -- string with placeholders similar to the ones used with Python's .format().
        s(
            "fmt1",
            fmt("To {title} {} {}.", {
                i(2, "Name"),
                i(3, "Surname"),
                title = c(1, { t("Mr."), t("Ms.") }),
            })
        ),
  --]]

    -- LSP version (this allows for simple snippets / copy-paste from vs code things)

    -- function(args, snip) ... end

    -- Using captured text <-- think of a fun way to use this.
    -- s({trig = "b(%d)", regTrig = true},
    -- f(function(args, snip) return
    -- "Captured Text: " .. snip.captures[1] .. "." end, {})

    -- the first few letters of a commit hash -> expand to correct one
    -- type the first few words of a commit message -> expands to commit hash that matches
    -- commit:Fixes #

    -- tree sitter
    -- :func:x -> find all functions in the file with x in the name, and choice between them

    -- auto-insert markdown footer?
    -- footer:(hello world)
    -- ^link
    -- callbacks [event.leave]

    --
    -- ls.parser.parse_snippet({trig = "lsp"}, "$1 is ${2|hard,easy,challenging|}")
})
```
