require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:INSPECT_MODE] = true
IRB.conf[:ECHO] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:HISTORY_NO_DUPS] = true

begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError
end
