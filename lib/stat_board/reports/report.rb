module StatBoard
  module Reports
    class Report
      attr_reader :start_date, :end_date

      def initialize(start_date, end_date)
        @start_date = start_date
        @end_date = end_date
      end

      def name
        # define in subclass
      end

      def scope(model)
        if model.is_a?(String)
          model.constantize
        else
          model
        end
      end

      def slug
        name.downcase.gsub(" ", "-")
      end

      def count(model)
        scope(model).count
      end
    end
  end
end
