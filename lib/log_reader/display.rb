# frozen_string_literal: true

module LogReader
  class Display
    HEADINGS = {
      complete_data: "Complete break down of data",
      error: "Following error happened while parsing the file"
    }.freeze

    def heading(heading)
      return if heading.nil?

      p "===>#{heading}"
    end

    def list(list, key, text)
      return if list.nil? || key.nil?

      list.each do |path, values|
        p "#{path} #{values[key]} #{text}"
      end
    end

    def complete_data(data)
      return if data.nil?

      heading HEADINGS[:complete_data]
      pp data
    end

    def show_errors(errors)
      return if errors.nil?

      heading HEADINGS[:error]
      p "=> #{errors}"
    end
  end
end
