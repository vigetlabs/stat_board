module StatBoard
  module Reports
    class MonthlyReport < Report
      def name
        "Last 30 days"
      end

      def scope(model)
        super.where(["created_at > ? AND created_at < ?", end_date - 30.days, end_date + 1.day])
      end
    end
  end
end
