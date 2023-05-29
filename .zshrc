# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="jonathan"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  archlinux
  pass
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
export EDITOR="nvim"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# General aliases
alias sudo="doas"
alias hypr="Hyprland"
alias nv="nvim"
alias po="poweroff"
alias rb="reboot"
alias sk="screenkey -p fixed -g 15%x5%+84%-15% &"
alias skk="killall screenkey"

# Git aliases
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gck="git checkout"
alias gcb="git checkout -b"
alias gf="git fetch"
alias gm="git merge"
alias gpl="git pull"
alias gps="git push"
alias gr="git rebase"
alias gs="git status"

# GitHub CLI aliases
alias ghrn="gh repo create"
alias ghrc="gh repo clone"

# Rust aliases
alias ca="cargo add"
alias cb="cargo build"
alias cbr="cargo build --release"
alias cbp="cargo build --profile"
alias cr="cargo run"
alias crr="cargo run --release"
alias crp="cargo run --profile"
alias cw="cargo watch -x"
alias cwb="cargo watch -x build"
alias cwr="cargo watch -x run"
alias cwt="cargo watch -x test"

# MariaDB alias
alias mdb="mariadb -u root -p"

# Makefile aliases
alias mc="make clean"
alias mr="make run"
alias mrl="make release"
alias mt="make test"

# Redshift aliases
alias redon="redshift -P -O 3400"
alias redoff="redshift -P -O 6500"
alias redset="redshift -P -O"

# PNPM aliases
alias nin="pnpm install"
alias ning="pnpm install -g"
alias nrb="pnpm run build"
alias nrbp="pnpm run build && pnpm run preview"
alias nrd="pnpm run dev"

# Prisma aliases
alias prin="pnpm install prisma @prisma/client"
alias prinit="pnpx prisma init --datasource-provider sqlite"
alias pps="pnpx prisma db push && pnpx prisma generate"

# Svelte aliases
alias svnew="pnpm create svelte@latest"
alias twin="pnpm install -D tailwindcss postcss autoprefixer"
alias twcfg="pnpx tailwindcss init tailwind.config.cjs -p"
alias luin="pnpm add lucia-auth @lucia-auth/adapter-prisma"

# T3 stack aliases
alias t3new="pnpm create t3-app@latest"

# Tmux aliases
alias t="tmux"
alias tns="tmux new -s"
alias tks="tmux kill-session -t"
alias tls="tmux ls"

# Haskell aliases
alias cblin="cabal install --ghc-options=-dynamic"
alias stin="stack install"

# pnpm
export PNPM_HOME="/home/sampie/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# opam configuration
[[ ! -r /home/sampie/.opam/opam-init/init.zsh ]] || source /home/sampie/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
