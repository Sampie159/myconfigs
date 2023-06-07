local ls = require('luasnip')
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local filename = function()
  return f(function(_args, snip)
    local name = vim.split(snip.snippet.env.TM_FILENAME, '.', true)
    return string.upper(name[1]) or ""
  end)
end

local snippets, autosnippets = {}, {}

local headinit = s('headinit', fmt([[
#ifndef _{}_H_
#define _{}_H_

{}

#endif /* _{}_H_ */
]], { filename(), filename(), i(0, '// Your code here'), filename() }))
table.insert(autosnippets, headinit)


return snippets, autosnippets
