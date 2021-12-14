# move to trash, use like `del {file_name}`
alias del='gio trash'

alias date_timestamp='date +"%s"'
alias date_format='date +"%Y-%m-%d %T"'

alias cc='clear && clear'

# clearfile > file.log
# alias clearfile='echo -n ""'
alias clearfile='truncate --size 0'
alias upbash='source ~/.profile'
alias gr='grep --recursive --line-number --ignore-case'
alias ff='find ./ -not -path "./.git/*" -iname'

alias git_config_user_work="git config user.email $(git config --get work.email) && git config user.name $(git config --get work.user)"
alias git_config_user_personal="git config user.email $(git config --get personal.email) && git config user.name $(git config --get personal.user)"

# docker
alias dc='docker-compose'
alias dcup='docker-compose up -d && docker-compose ps'
alias dcstop='docker-compose stop'
alias dcrestart='docker-compose stop && docker-compose up -d && docker-compose ps'
alias dcdown='docker-compose down -v'
alias dcclear='docker-compose down -v && docker-compose up -d --build && docker-compose ps'
alias dcbuild='docker-compose up -d --build && docker-compose ps'

# vim
alias e='vim'
alias hosts='vim /etc/hosts'
alias shosts='sudo -E vim /etc/hosts'
