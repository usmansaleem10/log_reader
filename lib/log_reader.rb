# frozen_string_literal: true

require_relative "log_reader/parser"

module LogReader
  class Error < StandardError; end

  class PageStats
    def call
      Parser.new("/Users/usman/www/sites/tests/smart-pension/log_reader/spec/tmp/webserver.log").call
    end
  end
end
