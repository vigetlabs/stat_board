module StatBoard
  module Reports
    class OverallReport < Report
      def name
        "Overall"
      end

      def scope(model)
        model
      end
    end
  end
end
