# frozen_string_literal: true

RSpec.describe LogReader::PageStats do
  let(:file) { "/Users/usman/www/sites/tests/smart-pension/log_reader/spec/tmp/webserver.log" }
  subject { LogReader::PageStats.new(file) }
  context "PageStats" do
    it "triggers parser" do
      expect(subject.parser).to receive(:call)
      subject.call
    end
  end
end
