export PATH="/usr/local/opt/awscli@1/bin:$PATH"
export AWS_DEFAULT_REGION=us-east-1

bindkey -v

# load aliases
# https://stackoverflow.com/a/246128
SOURCE=${(%):-%N}
OMZ_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
source $OMZ_DIR/aliases

#### GIT ####
# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh

# autocomplete
autoload -Uz compinit && compinit

# prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'

#### GIT ####

# this enables history search starts with https://unix.stackexchange.com/a/97844
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# angular stuff that is not happy
#export NVM_DIR="$HOME/.nvm"
#source $(brew --prefix nvm)/nvm.sh
#[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
#echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
#echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

# moo
COWPATH="$HOME/.cowsay/cowfiles"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/adam.schreiner/.sdkman"
[[ -s "/Users/adam.schreiner/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/adam.schreiner/.sdkman/bin/sdkman-init.sh"
