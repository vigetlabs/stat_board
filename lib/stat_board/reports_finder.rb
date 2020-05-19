module StatBoard
  class ReportsFinder < Struct.new(:directory)
    def report_klasses
      Dir[File.join(directory, "/*_report.rb")].map do |report|
        "StatBoard::Reports::#{File.basename(report, ".rb").camelcase}".constantize
      end
    end

    def self.all
      self.new(File.join(StatBoard::Engine.root, "lib/stat_board/reports")).report_klasses +
      self.new(File.join(Rails.root, "lib/stat_board/reports")).report_klasses
    end
  end
end
