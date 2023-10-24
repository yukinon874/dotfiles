# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# (~/.zshrc 冒頭)
# in ~/.zshenv, executed `unsetopt GLOBAL_RCS` and ignored /etc/zshrc
#
#[ -r /etc/zshrc ] && . /etc/zshrc
#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi

# startup script
#zsh ~/startup/startup.sh # 例）$HOME/startup/startup.sh
setopt ZLE

# 色を使用
autoload -Uz colors
colors

# 補完
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
autoload -Uz compinit
compinit -u


# cdの後にlsを実行
chpwd() { ls -GF }
# 他のターミナルとヒストリーを共有
setopt share_history
# ヒストリーに重複を表示しない
setopt histignorealldups
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd
alias ls='ls -GF'
alias la='ls -a -GF'
alias g++='/opt/homebrew/bin/g++-13 -O2 -std=c++20 -I ~/Programming/library/ac-library/ -I /opt/homebrew/Cellar/boost/1.82.0_1/include'
#export GYAZO_ACCESS_TOKEN="7d1d3a273b1e4beb2db3fb81e4bf85856dade0a42ac00e2f56ccddcf38dc6e30"

PATH="/opt/homebrew/opt/gnu-time/libexec/gnubin:$PATH"

#vim bindding
bindkey -v
#コマンドの前に改行する
#precmd () {
#  print
#}
#vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
#vim_cmd_mode="%{$fg[green]%}[CMD]%{$reset_color%}"
#vim_mode=$vim_ins_mode
#function zle-keymap-select {
#  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
#  PROMPT="%(?.%{${fg[blue]}%}.%{${fg[red]}%})%n${reset_color}:%~
#${vim_mode}( ╹╹) < "
#  zle reset-prompt
#}
#zle -N zle-keymap-select
#function zle-line-finish {
#  vim_mode=$vim_ins_mode
#  PROMPT="%(?.%{${fg[blue]}%}.%{${fg[red]}%})%n${reset_color}:%~
#${vim_mode}( ╹╹) < "
#  zle reset-prompt
#}
#zle -N zle-line-finish
#function TRAPINT() {
#  vim_mode=$vim_ins_mode
#  PROMPT="%(?.%{${fg[blue]}%}.%{${fg[red]}%})%n${reset_color}:%~
#${vim_mode}( ╹╹) < "
#  zle reset-prompt
#  return $(( 128 + $1 ))
#}
#次のkeyの受付時間を決める(1 / 100 sec)
#KEYTIMEOUT=20
KEYTIMEOUT=1
#いつもの
#bindkey -M viins 'jj' vi-cmd-mode
# プロンプトの表示
#PROMPT="%(?.%{${fg[blue]}%}.%{${fg[red]}%})%n${reset_color}:%~
#${vim_mode}( ╹╹) < "
#RPROMPT=$'%{\e[38;5;251m%}%D{%b %d} %*%{\e[m%}'
# delete insert mode before char
bindkey -v "^W" backward-kill-word # vi-backward-kill-word
bindkey -v "^H" backward-delete-char # vi-backward-delete-char
bindkey -v "^U" kill-line # vi-kill-line
bindkey -v "^?" backward-delete-char # vi-backward-delete-char
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^R" history-incremental-search-backward
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line


# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
