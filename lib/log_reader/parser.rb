# frozen_string_literal: true

require_relative "reader"
require_relative "display"

module LogReader
  class Parser
    attr_reader :file, :data

    def initialize(file)
      @file = file
      @display = LogReader::Display.new
    end

    def call
      reader = LogReader::Reader.new(file)
      # TODO: return if errors
      reader.call
      @data = reader.json_data

      max_visit
      max_uniq_visit
      @display.complete_data data
    end

    private

    def max_visit
      @display.heading "Max visited sites are"
      list = data.sort { |a, b| b[1][:count] <=> a[1][:count] }.to_h
      @display.list list, :count, "visits"
    end

    def max_uniq_visit
      @display.heading "Max uniq visited sites are"

      list = data.sort { |a, b| b[1][:uniq_visit] <=> a[1][:uniq_visit] }.to_h
      @display.list list, :uniq_visit, "unique views"
    end
  end
end
