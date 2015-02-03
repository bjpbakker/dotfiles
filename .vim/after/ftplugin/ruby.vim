map <Leader>t :call RunCurrentSpecFile()<cr>
map <Leader>s :call RunNearestSpec()<cr>
map <Leader>l :call RunLastSpec()<cr>
map <Leader>a :call RunAllSpecs()<cr>

let g:rspec_command = "Dispatch bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm"

setlocal shiftwidth=2 tabstop=2
