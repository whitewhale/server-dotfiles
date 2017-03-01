# easier navigation: .., ..., ...., ....., ~ and -
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# ls
alias ll='ls -al'
alias l.='ls -d .*'
alias lsd="ls -l | grep --color=never '^d'"

# shortcuts
alias g="git"
alias h="history"
alias j="jobs"
alias gr='egrep -Irn --exclude="*\.svn*" --exclude="\.git" --exclude="*\.log"'
alias 'ps?'='ps ax | grep '
alias 'h?'='history | grep '
alias fn='find . -name'
