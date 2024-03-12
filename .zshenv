export EDITOR="nvim"
export CC="clang"
export CXX="clang++"
export RUSTC_WRAPPER="sccache"

typeset -U path PATH
path=($HOME/.nimble/bin $HOME/.config/emacs/bin $HOME/.local/bin $HOME/.nimble/bin $HOME/.cabal/bin $HOME/.npm-global/bin $(go env GOBIN) $(go env GOPATH)/bin $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin $HOME/.cargo/bin $path)
. "$HOME/.cargo/env"
