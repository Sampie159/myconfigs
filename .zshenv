export EDITOR="nvim"

typeset -U path PATH
path=($HOME/.local/bin $HOME/.cabal/bin $HOME/.npm-global/bin $(go env GOBIN) $(go env GOPATH)/bin $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin $HOME/.cargo/bin $path)
. "$HOME/.cargo/env"
