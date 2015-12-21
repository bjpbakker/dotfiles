require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000

def load_irbrc(path)
  return if ['/', ENV['HOME']].include?(path)
  load_irbrc File.dirname(path)
  irbrc = File.join(path, '.irbrc')
  load(irbrc) if File.exists?(irbrc)
end
load_irbrc(Dir.pwd)
