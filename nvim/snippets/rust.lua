local ls = require('luasnip')
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f= ls.function_node
local sn = ls.snippet_node

local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local snippets, autosnippets = {}, {}

local fn = s('fn', fmt([[
fn {}({}) {} {{
    {}
}}
]], {
    i(1, 'function_name'),
    c(2, { t(''), i(1, 'parameters') }),
    c(3, { t(''), i(1, 'return_type') }),
    i(4, '//Function body')
  }))
table.insert(autosnippets, fn)

local pfn = s('pfn', fmt([[
pub fn {}({}) {} {{
    {}
}}
]], {
    i(1, 'function_name'),
    c(2, { t(''), i(1, 'parameters') }),
    c(3, { t(''), i(1, 'return_type') }),
    i(4, '//Function body')
  }))
table.insert(autosnippets, pfn)

return snippets, autosnippets
