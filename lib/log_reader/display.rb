# frozen_string_literal: true

module LogReader
  class Display
    HEADINGS = {
      complete_data: "Complete break down of data",
      error: "Following error happened while parsing the file"
    }.freeze

    def heading(heading)
      p "*" * 100
      p heading
      p "*" * 100
    end

    def list(list, key, text)
      list.each do |path, values|
        p "#{path} #{values[key]} #{text}"
      end
    end

    def complete_data(data)
      heading HEADINGS[:complete_data]
      pp data
    end

    def show_errors(errors)
      heading HEADINGS[:error]
      p "=> #{errors}"
    end
  end
end
