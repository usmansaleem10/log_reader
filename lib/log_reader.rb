# frozen_string_literal: true

require_relative "log_reader/version"
require_relative "log_reader/parser"

module LogReader
  class Error < StandardError; end
  Parser.new("/Users/usman/www/sites/tests/smart-pension/log_reader/webserver.log").call
end
