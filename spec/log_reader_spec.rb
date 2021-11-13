# frozen_string_literal: true

RSpec.describe LogReader do
  it "has a version number" do
    expect(LogReader::VERSION).not_to be nil
  end

  it "triggers parser" do
    expect(false).to eq(true)
  end
end
