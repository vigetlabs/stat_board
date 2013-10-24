require "spec_helper"

describe "a user visiting the stat board" do
  it "sees the dashboard" do
    visit "/stats"
    page.should have_content("StatBoard")
  end

  it "sees the specified models (post and user)" do
    visit "/stats"
    page.should have_content("Posts")
    page.should have_content("Users")
  end

  it "sees the graph", :js => true do
    visit "/stats"
    page.should have_content("Highcharts.com")
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
      within "div#last-30-days" do
        page.should have_content("0")
      end
    end

    it "sees that no posts were created this week" do
      within "div#last-7-days" do
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
      within "div#last-30-days" do
        page.should have_content("2")
      end
    end

    it "sees that 1 post was created this week" do
      within "div#last-7-days" do
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

    after do
      StatBoard.title = nil
    end
  end

  describe "with auth credentials" do
    before do
      StatBoard.username = "user"
      StatBoard.password = "pass"
    end

    it "gets a request for authentication if none provided" do
      visit "/stats"
      page.status_code.should == 401
    end

    it "gets a request for authentication if bad details provided" do
      page.driver.browser.authorize("user", "wrong")
      visit "/stats"
      page.status_code.should == 401
    end

    it "sees the stat board if correct details provided" do
      page.driver.browser.authorize("user", "pass")
      visit "/stats"
      page.should have_content("StatBoard")
    end

    it "does not need details if only partial credentials specified" do
      StatBoard.password = nil
      visit "/stats"
      page.should have_content("StatBoard")
    end

    after do
      StatBoard.username = nil
      StatBoard.password = nil
    end
  end

  describe "with models listed as strings" do
    before do
      StatBoard.models = %w(Post)
      Post.create
      visit "/stats"
    end

    it "loads and queries them appropriately" do
      within "div#overall" do
        page.should have_content("1")
      end
    end

    after do
      StatBoard.models = [Post]
    end
  end
end
