module StatBoard
  class ReportsFinder < Struct.new(:directory)
    def reports
      Dir[File.join(directory, "/*_report.rb")].map do |report|
        "StatBoard::Reports::#{File.basename(report, ".rb").camelcase}".constantize.new
      end
    end

    def self.all
      self.new(File.join(StatBoard::Engine.root, "lib/stat_board/reports")).reports +
      self.new(File.join(Rails.root, "lib/stat_board/reports")).reports
    end
  end
end
