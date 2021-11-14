# frozen_string_literal: true

RSpec.describe LogReader::Reader do
  let(:file) { "/Users/usman/www/sites/tests/smart-pension/log_reader/spec/tmp/webserver.log" }
  let(:invalid_file) { "xyz.log" }
  let(:invalid_file1) { "/Users/usman/www/sites/tests/smart-pension/log_reader/spec/tmp/webserver.txt" }
  subject { LogReader::Reader.new(file) }
  describe "Initialization" do
    it "throws error if no param is provided" do
      expect { LogReader::Reader.new }.to raise_error
    end
    it "doesn't throws error if  param is provided" do
      expect { LogReader::Reader.new(file) }.not_to raise_error
    end
  end
  describe "Validation" do
    context "invalid file type" do
      let(:object) { LogReader::Reader.new(invalid_file) }
      it "generates error if file doesn't exist" do
        expect(object.errors).to eq(LogReader::Reader::ERRORS[:blank_file])
      end
    end
    context "file  doesn't exist" do
      let(:object) { LogReader::Reader.new(invalid_file1) }
      it "generates error if file ext is not log" do
        expect(object.errors).to eq(LogReader::Reader::ERRORS[:invalid_file])
      end
    end
  end

  describe "Data" do
    context " count compiled correctly" do
      let(:keys) { ["/help_page/1", "/contact", "/home", "/about/2", "/index", "/about"] }
      it "has all keys" do
        subject.call
        expect(subject.json_data.keys).to eq keys
      end
      it "has right count of /help_page/1" do
        subject.call
        expect(subject.json_data["/help_page/1"][:count]).to eq 80
      end
      it "has right count of /home" do
        subject.call
        expect(subject.json_data["/home"][:count]).to eq 78
      end
      it "has right count of /contact" do
        subject.call
        expect(subject.json_data["/contact"][:count]).to eq 89
      end
      it "has right count of /about/2" do
        subject.call
        expect(subject.json_data["/about/2"][:count]).to eq 90
      end
      it "has right count of index" do
        subject.call
        expect(subject.json_data["/index"][:count]).to eq 82
      end
      it "has right count of about" do
        subject.call
        expect(subject.json_data["/about"][:count]).to eq 81
      end
    end
  end
  describe "Data" do
    context " uniq count compiled correctly" do
      it "has uniq right count of /help_page/1" do
        subject.call
        expect(subject.json_data["/help_page/1"][:uniq_visit]).to eq 23
      end
      it "has uniq right count of /home" do
        subject.call
        expect(subject.json_data["/home"][:uniq_visit]).to eq 23
      end
      it "has uniq right count of /contact" do
        subject.call
        expect(subject.json_data["/contact"][:uniq_visit]).to eq 23
      end
      it "has uniq right count of /about/2" do
        subject.call
        expect(subject.json_data["/about/2"][:uniq_visit]).to eq 22
      end
      it "has uniq right count of index" do
        subject.call
        expect(subject.json_data["/index"][:uniq_visit]).to eq 23
      end
      it "has uniq right count of about" do
        subject.call
        expect(subject.json_data["/about"][:uniq_visit]).to eq 21
      end
    end
  end
end
