eval "$(rbenv init -)"

be() { bundle exec $* }

alias migrate='be rake db:migrate parallel:prepare'
alias db_reset='be rake db:drop db:create db:setup && be rake parallel:prepare'

export PARALLEL_TEST_PROCESSORS=6
