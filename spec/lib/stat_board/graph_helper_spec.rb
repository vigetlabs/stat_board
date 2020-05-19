require 'spec_helper'

describe StatBoard::GraphHelper do
  subject { described_class.new(100.years.ago, Date.today) }

  describe "#date_steps" do
    it "returns 1 if date_range has less than 50 days" do
      subject.stub(:start_at).and_return(Time.now - 20.days)

      subject.date_steps.should == 1
    end

    it "returns 2 if date_range has 100 days in it (100 / 50)" do
      subject.stub(:start_at).and_return(Time.now - 100.days)

      subject.date_steps.should == 2
    end
  end

  describe "#resources_by_date" do
    it "returns the desired array in string form" do
      post1 = Post.create
      post2 = Post.create

      post1.update_attribute(:created_at, Time.now - 7.days)
      post2.update_attribute(:created_at, Time.now - 3.days)

      # Array of length 8 (since first entry was created 7 days ago)
      # First entry is 0
      # Entries from index 1 to 4 are "1"
      # Entries from index 5 on are "2" since that's when post2 was created
      subject.resources_by_date("Post").should == "[0, 1, 1, 1, 1, 2, 2, 2]"
    end
  end
end
