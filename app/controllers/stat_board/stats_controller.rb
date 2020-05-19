require_dependency "stat_board/application_controller"

module StatBoard
  class StatsController < ApplicationController

    def index
      @reports = ReportsFinder.all.map do |report_klass|
        report_klass.new(start_at, end_at)
      end
    end

    private

    [:date_steps, :resources_by_date].each do |method|
      helper_method method
      delegate method, :to => :graph_helper
    end

    def graph_helper
      @graph_helper ||= GraphHelper.new(start_at, end_at)
    end

    def start_at
      @start_at ||= begin
        Date.parse(params[:stats][:start_at])
      rescue
        first_day_ever
      end
    end
    helper_method :start_at

    def end_at
      @end_at ||= Date.parse(params[:stats][:end_at])
    rescue
      Date.today
    end
    helper_method :end_at

    def first_day_ever
      StatBoard.models.map do |m|
        klass = m.to_s.constantize
        klass.order("created_at ASC").first.try(:created_at) || Time.now
      end.sort.first
    end
    helper_method :first_day_ever
  end
end
