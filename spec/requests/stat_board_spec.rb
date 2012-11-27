require "spec_helper"

describe "a user visiting the stat board" do
  it "sees the dashboard" do
    visit "/stats"
    page.should have_content("StatBoard")
  end  

  it "sees the specified models (post)" do
    visit "/stats"
    page.should have_content("Posts")
  end

  describe "with no records" do
    before do
      visit "/stats"
    end

    it "sees that no posts were created overall" do
      within "div#overall" do
        page.should have_content("0")
      end
    end

    it "sees that no posts were created this month" do
      within "div#this-month" do
        page.should have_content("0")
      end
    end

    it "sees that no posts were created this week" do
      within "div#this-week" do
        page.should have_content("0")
      end
    end
  end

  describe "with some records" do
    before do
      Post.create(:created_at => 1.year.ago)
      Post.create(:created_at => 2.weeks.ago)
      Post.create(:created_at => 2.days.ago)

      visit "/stats"
    end

    it "sees that 3 posts were created overall" do
      within "div#overall" do
        page.should have_content("3")
      end
    end

    it "sees that 2 posts were created this month" do
      within "div#this-month" do
        page.should have_content("2")
      end
    end

    it "sees that 1 post was created this week" do
      within "div#this-week" do
        page.should have_content("1")
      end
    end
  end

  describe "with a custom title" do
    before do
      StatBoard.title = "App Stats"
    end

    it "sees it" do
      visit "/stats"
      page.should have_content("App Stats")
    end
  end
end
