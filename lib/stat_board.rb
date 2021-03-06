require "stat_board/engine"
require "stat_board/reports/report"
require "stat_board/reports/overall_report"
require "stat_board/reports/monthly_report"
require "stat_board/reports/weekly_report"
require "stat_board/graph_helper"
require "stat_board/reports_finder"

module StatBoard
  mattr_accessor :models, :title, :display_graph, :username, :password

  # Display graph by default. Can be disabled in initializers/stat_board.rb.
  @@display_graph = true
end
