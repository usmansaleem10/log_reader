# frozen_string_literal: true

module LogReader
  class Display
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
      heading "complete break down of data"
      pp data
    end
  end
end
