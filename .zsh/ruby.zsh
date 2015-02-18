eval "$(rbenv init -)"

alias migrate='bundle exec rake db:schema:load db:test:clone parallel:prepare'
alias remigrate='bundle exec rake db:drop db:create db:schema:load db:test:clone parallel:prepare'

export PARALLEL_TEST_PROCESSORS=6
