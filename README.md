# Bart Bakker's dotfiles

This repository contains my personal configuration files. Feel free to copy all
of it. If you believe anything is missing or just plain wrong, I am very 
interested to learn about that. Feel free to open an issue at all times.

## Installation

Clone this repository in $HOME. That's it.

Vim plugins are managed using [Vundle.vim](https://github.com/gmarik/Vundle.vim).
Vundle is a submodule which can be initialized with `git submodule init`. Then 
run vim to install the plugins: `vim +PluginInstall +qall`.

## Software

Below is a listing of some of the software I use, which I kept track of while 
installing my current MacBook Pro. I do not tend to keep this list in sync very 
often, but keep this as a reference of some of settings I need to do to get a 
system I can work with.

### General

* FileVault
* Time Machine
* 1Password
* Caffeine
* [f.lux](https://justgetflux.com)
* iTunes, Spotify

### Productivity

* Alfred
* Pages, Numbers, Keynote
* Screenflow
* iBooks, Kindle, Pocket, Feedly

### Internet

* Airmail, Mailbox, Twitter
* Safari, Chrome
* Cloud, Dropbox
* Skype

### Development

* iTerm2
  * Pastel color schema
  * 13pt [Inconsolata-g](http://leonardo-m.livejournal.com/77079.html) font (.otf)
  * left option-key acts as +Esc
* XCode (also command-line tools: `xcode-select --install`)
* Dash
* [Homebrew](http://brew.sh)
  * git
  * the\_silver\_searcher markdown tree
  * autojump zsh-completions
  * vim --override-system-vi
  * scala --with-doc --with-src
  * elixir erlang ghc go node python
  * io --without-addons
  * maven sbt leiningen
  * rbenv ruby-build
  * postgresql
  * phantomjs
  * ansible
  * brew-cask
* `brew tap caskroom/cask`
  * vagrant virtualbox
* Oracle JDK
* IntelliJ IDEA (with [preferences](https://github.com/bjpbakker/intellij-idea))
* [P4Merge](http://www.perforce.com/downloads/Perforce/20-User#10)
* `ln -s /System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc /usr/local/bin/jsc`

