module StatBoard
  module Reports
    class OverallReport < Report
      def name(original_date = nil)
        if original_date
          "Overall (since #{original_date.strftime("%m-%d-%Y")})"
        else
          "Overall"
        end
      end
    end
  end
end
