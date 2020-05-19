module StatBoard
  class ApplicationController < ActionController::Base
    before_action :basic_authenticate, :if => lambda { StatBoard.username && StatBoard.password }

    private

    def basic_authenticate
      authenticate_or_request_with_http_basic do |name, password|
        name == StatBoard.username && password == StatBoard.password
      end
    end

  end
end
