module StatBoard
  module Reports
    class OverallReport < Report
      def name
        "Overall (#{start_date.strftime("%m-%d-%Y")} - #{end_date.strftime("%m-%d-%Y")})"
      end

      def scope(model)
        super.where(["created_at > ? AND created_at < ?", start_date, end_date + 1.day])
      end
    end
  end
end
