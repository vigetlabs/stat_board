require_dependency "stat_board/application_controller"

module StatBoard
  class StatsController < ApplicationController
    before_action :basic_authenticate, :if => lambda { StatBoard.username && StatBoard.password }

    def index
      @reports = ReportsFinder.all
    end

    private

    def basic_authenticate
      authenticate_or_request_with_http_basic do |name, password|
        name == StatBoard.username && password == StatBoard.password
      end
    end
  end
end
