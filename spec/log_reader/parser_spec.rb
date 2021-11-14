# frozen_string_literal: true

RSpec.describe LogReader::Parser do
  let(:file) { "/Users/usman/www/sites/tests/smart-pension/log_reader/spec/tmp/webserver.log" }
  subject { LogReader::Parser.new(file) }
  describe "initialize" do
    it "throws error if no param is provided" do
      expect { LogReader::Parser.new }.to raise_error
    end
    it "doesn't throws error if  param is provided" do
      expect { LogReader::Parser.new(file) }.not_to raise_error
    end
    context "call" do
      it "invokes max_visit" do
        expect(subject).to receive(:max_visit)
        subject.call
      end
      it "invokes max_uniq_visit" do
        expect(subject).to receive(:max_uniq_visit)
        subject.call
      end

      xit "sorts data correctly" do
      end
    end
  end
end
