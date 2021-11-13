# frozen_string_literal: true

require_relative "reader"

module LogReader
  class Parser
    attr_reader :file, :data

    def initialize(file)
      @file = file
    end

    def call
      reader = LogReader::Reader.new(file)
      # TODO: return if errors
      reader.call
      @data = reader.json_data

      max_visit
      max_uniq_visit
      complete_data
    end

    private

    def max_visit
      print_heading "Max visited sites are"
      list = data.sort { |a, b| b[1][:count] <=> a[1][:count] }.to_h
      list.each do |path, values|
        p "#{path} #{values[:count]} visits"
      end
    end

    def max_uniq_visit
      print_heading "Max uniq visited sites are"

      list = data.sort { |a, b| b[1][:uniq_visit] <=> a[1][:uniq_visit] }.to_h
      list.each do |path, values|
        p "#{path} #{values[:uniq_visit]} unique views"
      end
    end

    def complete_data
      print_heading "complete break down of data"
      pp data
    end

    def print_heading(heading)
      p "*" * 100
      p heading
      p "*" * 100
    end
  end
end
