module StatBoard
  module Reports
    class WeeklyReport < Report
      def name
        "Last 7 days"
      end

      def scope(model)
        super.where(["created_at > ? AND created_at < ?", end_date - 1.week, end_date + 1.day])
      end
    end
  end
end
