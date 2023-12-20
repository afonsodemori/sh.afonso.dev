#!/bin/bash
__bash_prompt() {
    local user_part='`export XIT=$? \
        && echo -n "\[\033[0;32m\]\u " \
        && [ "$XIT" -ne "0" ] && echo -n "\[\033[1;31m\]➜" || echo -n "\[\033[0m\]➜"`'
    local git_branch='`\
        export BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null); \
        if [ "${BRANCH}" != "" ]; then \
            echo -n "\[\033[0;36m\](\[\033[1;31m\]${BRANCH}" \
            && if git ls-files --error-unmatch -m --directory --no-empty-directory -o --exclude-standard ":/*" > /dev/null 2>&1; then \
                echo -n " \[\033[1;33m\]✗"; \
            fi \
            && echo -n "\[\033[0;36m\])"; \
        fi`'
    local light_blue='\[\033[1;34m\]'
    local remove_color='\[\033[0m\]'
    PS1="\n${user_part} ${light_blue}\w ${git_branch}${remove_color}\n\$ "
    unset -f __bash_prompt
}
__bash_prompt

alias ll='ls --color -alF'

printf "\n[?] Install additional shortcuts? (be careful)\n[^C to cancel]\a\n\n"
read -r
alias c='clear'
alias gs='git status'
alias gc='git checkout'
alias gd='git diff'
alias ga='git add'
alias gl='git log'
alias glo='git log --oneline'
