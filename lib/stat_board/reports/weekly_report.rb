module StatBoard
  module Reports
    class WeeklyReport < Report
      def name
        "This Week"
      end

      def scope(model)
        super.where(["created_at > ?", 1.week.ago])
      end
    end
  end
end
