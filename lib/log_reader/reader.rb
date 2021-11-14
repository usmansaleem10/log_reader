# frozen_string_literal: true

module LogReader
  class Reader
    attr_reader :file, :errors, :json_data

    ALLOWED_EXT = %w[.log].freeze
    ERRORS = {
      invalid_file: "Invalid file type",
      blank_file: "File doesn't exist"
    }.freeze

    def initialize(file)
      validate_file(file)
      return if errors

      @file = File.open(file)
      @json_data = {}
    end

    def call
      file_data = @file.readlines.map(&:chomp)
      file_data.each do |row|
        add_data(row)
      end
      json_data
    end

    private

    def validate_file(file)
      return @errors = ERRORS[:blank_file] unless File.file?(file)

      @errors = ERRORS[:invalid_file] unless ALLOWED_EXT.include? File.extname(file)
    end

    def add_data(data)
      path, ip = data.split(" ")
      if json_data[path].nil?
        json_data[path] = { count: 1, uniq_visit: 1, ips: {} }
        json_data[path][:ips][ip] = 1
      else
        json_data[path][:ips][ip] = add_ip_data(path, ip)
        json_data[path][:count] = json_data[path][:count] + 1
      end
    end

    def add_ip_data(path, ip)
      if json_data[path][:ips][ip]
        json_data[path][:ips][ip] + 1
      else
        json_data[path][:uniq_visit] = json_data[path][:uniq_visit] + 1
        1
      end
    end
  end
end
