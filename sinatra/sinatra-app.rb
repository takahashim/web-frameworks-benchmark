#!/usr/bin/env ruby
require 'rubygems'
require 'daemons'

# -- sinatra-app.rb -e production -p 5000
__DIR__ = File.expand_path(File.dirname(__FILE__))
Daemons.run_proc('sinatra-daemon', :log_output => 'sinatra.log') do
  Dir.chdir(__DIR__)
  ARGV.shift
  ARGV.shift
  env = ARGV.shift
  port = ARGV.shift

  exec "ruby sinatra-hi.rb -e #{env} -p #{port}"
end
