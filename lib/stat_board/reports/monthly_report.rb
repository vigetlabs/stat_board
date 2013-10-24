module StatBoard
  module Reports
    class MonthlyReport < Report
      def name
        "Last 30 days"
      end

      def scope(model)
        super.where(["created_at > ?", 30.days.ago])
      end
    end
  end
end
