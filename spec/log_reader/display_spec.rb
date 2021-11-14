# frozen_string_literal: true

RSpec.describe LogReader::Display do
  subject { LogReader::Display.new }
  describe "Heading" do
    context "Prints heading" do
      let(:heading) { "heading" }
      it "prints heading on console" do
        expect { subject.heading(heading) }.to output("\"===>#{heading}\"\n").to_stdout
      end
    end
    context "Doesn't print heading" do
      let(:heading) { nil }
      it "doesn't prints heading on console" do
        expect { subject.heading(heading) }.not_to output.to_stdout
      end
    end
  end

  describe "List" do
    context "Prints list" do
      let(:list) { { "page1" => { count: 1 }, "page2" => { count: 2 } } }
      it "prints list on console" do
        expect { subject.list(list, :count, "visits") }.to output("\"page1 1 visits\"\n\"page2 2 visits\"\n").to_stdout
      end
    end
    context "Doesn't print list" do
      let(:list) { nil }
      it "doesn't prints list on console" do
        expect { subject.list(list, :count, "visits") }.not_to output.to_stdout
      end
    end
  end

  describe "data" do
    context "Prints data" do
      let(:data) { { "page1" => { count: 1 }, "page2" => { count: 2 } } }
      it "prints data on console" do
        expect do
          subject.complete_data(data)
        end.to output("\"===>#{LogReader::Display::HEADINGS[:complete_data]}\"\n{\"page1\"=>{:count=>1}, \"page2\"=>{:count=>2}}\n").to_stdout
      end
    end
    context "Doesn't print data" do
      let(:data) { nil }
      it "doesn't prints data on console" do
        expect { subject.complete_data(data) }.not_to output.to_stdout
      end
    end
  end

  describe "error" do
    context "Prints error" do
      let(:error) { "error" }
      it "prints error on console" do
        expect do
          subject.show_errors(error)
        end.to output("\"===>#{LogReader::Display::HEADINGS[:error]}\"\n\"=> #{error}\"\n").to_stdout
      end
    end
    context "Doesn't print error" do
      let(:error) { nil }
      it "doesn't prints error on console" do
        expect { subject.show_errors(error) }.not_to output.to_stdout
      end
    end
  end
end
