TEST_LIVE_API = false

require 'rubygems'
require 'test/unit'

unless(TEST_LIVE_API)
  require 'webmock/test_unit'
  include WebMock
end

require_files = []
require_files << File.join(File.dirname(__FILE__), '..', 'lib', 'ruby-traileraddict.rb')
require_files.concat Dir[File.join(File.dirname(__FILE__), 'setup', '*.rb')]

require_files.each do |file|
  require File.expand_path(file)
end