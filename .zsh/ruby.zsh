eval "$(rbenv init -)"

be() { bundle exec $* }

alias migrate='be rake db:migrate db:test:clone parallel:prepare'
alias remigrate='be rake db:drop db:create db:schema:load && be rake db:test:clone parallel:prepare'

export PARALLEL_TEST_PROCESSORS=6
