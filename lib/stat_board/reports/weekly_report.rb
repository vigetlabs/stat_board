module StatBoard
  module Reports
    class WeeklyReport < Report
      def name
        "Last 7 days"
      end

      def scope(model)
        super.where(["created_at > ?", 1.week.ago])
      end
    end
  end
end
