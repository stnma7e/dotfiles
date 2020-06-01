# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="juanghurtado"
#ZSH_THEME="mortalscumbag"
#ZSH_THEME="trapd00r"
ZSH_THEME="sunrise"
#ZSH_THEME="bureau"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras mercurial archlinux cabal common-aliases battery)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/cb.sh

# Customize to your needs...

export TERM=xterm-256color
export SSH_AUTH_SOCK=0

alias ls='ls -Fsbh --color=always'
#alias rm='rm -i'
alias rm='gio trash'
alias remake='make clean; make'
alias time=/usr/bin/time
alias clock="~/bin/clock ~/.punchcard"

PATH=~/.cabal/bin:$PATH
PATH=~/.cargo/bin:$PATH
PATH=~/.usr/bin:$PATH
PATH=~/.usr/local/bin:$PATH
PATH=~/.usr/bin/cargo:$PATH
PATH=/opt/matlab/bin:$PATH
#PATH=/home/sam/.usr/programs/miniconda/bin:$PATH
PATH=~/programs/android/android-studio/bin:$PATH

export LIBGL_DEBUG=verbose
export MESA_DEBUG
export GOPATH=~
#export RUST_SRC_PATH=~/src/rust/src
export RUST_SRC_PATH=~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export RUST_BACKTRACE=1

# ##################################
# RESEARCH
#

export por=/home/sam/school/chem/mcdaniel/supercapacitor/porous

#
# #################################

# ##################################
# SCHOOL
#

export CLASSPATH=.:/home/sam/school/csc/1332\ hudachek-buswell/junit.jar:/home/sam/school/csc/1332\ hudachek-buswell/hamcrest-core.jar

export cs=/home/sam/school/csc/1332\ hudachek-buswell/

#
# #################################

# ################################
# Bookmarking
# ################################

export MARKPATH=$HOME/.marks
function jump { 
  cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
 function mark { 
  mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark { 
  rm -i $MARKPATH/$1 
}
function marks {
  ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

# ################################
#
#
# ###############################

GREP_OPTIONS=""
export LD_LIBRARY_PATH=/home/sam/programs/android/android-studio/sdk/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

command fortune -ae
