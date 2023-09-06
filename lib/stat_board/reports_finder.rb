module StatBoard
  class ReportsFinder < Struct.new(:directory)
    def report_klasses
      Dir[File.join(directory, "/*_report.rb")].map do |report|
        "StatBoard::Reports::#{File.basename(report, ".rb").camelcase}".constantize
      end
    end

    def self.all
      all_klasses = (
        self.new(File.join(StatBoard::Engine.root, "lib/stat_board/reports")).report_klasses +
        self.new(File.join(Rails.root, "lib/stat_board/reports")).report_klasses
      )

      all_klasses.sort_by do |klass|
        if klass.name.include?("::Overall")
          1
        elsif klass.name.include?("::Monthly")
          2
        elsif klass.name.include?("::Weekly")
          3
        else
          4
        end
      end
    end
  end
end
