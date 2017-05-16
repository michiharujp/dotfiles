autoload -Uz colors
colors

autoload -Uz compinit
compinit
# cd省略
setopt auto_cd
# コマンドの許可
setopt auto_pushd
setopt pushd_ignore_dups
# globを有効
setopt extended_glob
# space始まりを履歴に入れない
setopt hist_ignore_space
# コマンドミス修正
setopt correct
# beep無効
setopt no_beep
# flow無効
setopt no_flow_control
# ヒストリ保存時に余分なスペースを削除
setopt hist_reduce_blanks
# 重複コマンドの削除
setopt hist_ignore_all_dups

bindkey -v

alias ll='ls -la'


# display git branch
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
 psvar=()
 LANG=en_US.UTF-8 vcs_info
 [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"
