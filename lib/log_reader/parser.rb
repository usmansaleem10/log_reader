# frozen_string_literal: true

require_relative "reader"
require_relative "display"

module LogReader
  class Parser
    attr_reader :file, :data, :display, :reader

    HEADINGS = {
      max_visits: {
        heading: "Max visited sites are",
        text: "visits"
      },
      max_uniq_visits: {
        heading: "Max uniq visited sites are",
        text: "unique views"
      }
    }.freeze

    def initialize(file)
      @file = file
      @display = LogReader::Display.new
      @reader = LogReader::Reader.new(file)
    end

    def call
      return  display.show_errors reader.errors if reader.errors

      reader.call
      @data = reader.json_data
      max_visit
      max_uniq_visit
      display.complete_data data
    end

    private

    def max_visit
      display.heading HEADINGS[:max_visits][:heading]
      list = sort_data(:count)
      display.list list, :count, HEADINGS[:max_visits][:text]
    end

    def max_uniq_visit
      display.heading HEADINGS[:max_uniq_visits][:heading]

      list = sort_data(:uniq_visit)
      display.list list, :uniq_visit, HEADINGS[:max_uniq_visits][:text]
    end

    def sort_data(key)
      data.sort { |a, b| b[1][key] <=> a[1][key] }.to_h
    end
  end
end
