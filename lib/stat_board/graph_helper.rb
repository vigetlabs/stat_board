module StatBoard
  class GraphHelper
    attr_reader :start_at, :end_at

    def initialize(sa, ea)
      @start_at = sa.to_date
      @end_at   = ea.to_date
    end

    # a string of the array of the count of (klass) objects
    # along the date_range, on every displayed interval
    def resources_by_date(klass_name)
      @resrouces_cache ||= {}
      @resrouces_cache[klass_name] ||= begin
        klass = klass_name.to_s.constantize
        klass = klass.stat_board_scope if klass.respond_to?(:stat_board_scope)
        steps = date_range.step(date_steps).map(&:end_of_day)

        steps.map do |step_end|
          klass.where("created_at <= ?", step_end).count
        end
      end
    end

    # number of days per interval on the graph's x axis
    def date_steps
      @date_steps ||= date_range.count / [date_range.count, 50].min
    end

    private

    # range of dates shown on the graph (array of days)
    def date_range
      @date_range ||= start_at..end_at
    end

    # returns the earliest `created_at` of a given class
    # returns `Time.now` if none is available
    def first_day_of(klass_name)
      klass = klass_name.to_s.constantize
      klass.order("created_at ASC").first.try(:created_at) || Time.now
    end

  end
end
