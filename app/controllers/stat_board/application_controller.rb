module StatBoard
  class ApplicationController < ActionController::Base

    private

    [:date_steps, :first_day_ever, :resources_by_date].each do |method|
      helper_method method
      delegate method, :to => :graph_helper
    end

    def graph_helper
      @graph_helper ||= GraphHelper.new
    end

  end
end
