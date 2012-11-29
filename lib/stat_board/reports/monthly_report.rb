module StatBoard
  module Reports
    class MonthlyReport < Report
      def name
        "This Month"
      end

      def scope(model)
        super.where(["created_at > ?", 1.month.ago])
      end
    end
  end
end
