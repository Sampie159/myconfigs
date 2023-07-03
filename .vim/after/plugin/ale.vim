let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1

let g:ale_fixers = {'rust': ['rustfmt'], 'c': ['clang-format'], 'cpp': ['clang-format']}

let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
