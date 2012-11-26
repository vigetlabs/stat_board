require_dependency "stat_board/application_controller"

module StatBoard
  class StatsController < ApplicationController
    http_basic_authenticate_with :name     => StatBoard.username,
                                 :password => StatBoard.password,
                                 :if       => lambda { StatBoard.username && StatBoard.password }
  end
end
