eval "$(rbenv init -)"

be() { bundle exec $* }

alias migrate='be rake db:migrate'
alias db_reset='be rake db:drop db:create db:setup && be rake parallel:prepare'
alias pspec='DISABLE_SPRING=1 be rake spec'

export PARALLEL_TEST_PROCESSORS=6
