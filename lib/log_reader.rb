# frozen_string_literal: true

require_relative "log_reader/parser"

module LogReader
  class Error < StandardError; end

  class PageStats
    attr_reader :file, :parser

    def initialize(file)
      @file = file
      @parser = LogReader::Parser.new(file)
    end

    def call
      parser.call
    end
  end
end
