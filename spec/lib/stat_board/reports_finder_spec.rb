require 'spec_helper'

module StatBoard
  describe ReportsFinder do
    subject { ReportsFinder.new File.join(StatBoard::Engine.root, "lib/stat_board/reports") }

    describe "#reports" do
      let(:reports) { subject.reports }

      it "returns an array" do
        reports.should be_an(Array)
      end

      it "should contain at least one report" do
        reports.size.should be > 0
        reports.first.class.superclass.should == Reports::Report
      end
    end
  end
end
