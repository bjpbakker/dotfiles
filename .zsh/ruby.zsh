eval "$(rbenv init -)"

alias migrate='bundle exec rake db:migrate db:test:clone parallel:prepare'
alias remigrate='bundle exec rake db:drop db:create db:migrate db:test:clone parallel:prepare'
