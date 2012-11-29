module StatBoard
  module Reports
    class Report
      def name
        # define in subclass
      end

      def scope
        # define in subclass
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
