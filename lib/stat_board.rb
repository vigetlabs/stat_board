require "stat_board/engine"
require "stat_board/reports/report"
require "stat_board/reports/overall_report"
require "stat_board/reports/monthly_report"
require "stat_board/reports/weekly_report"

module StatBoard
  mattr_accessor :models, :title, :username, :password
end
