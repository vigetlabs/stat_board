module StatBoard
  class GraphHelper

    # number of days per interval on the graph's x axis
    def date_steps
      @date_steps ||= date_range.count / [date_range.count, 50].min
    end

    def first_day_ever
      @first_day_ever ||= first_day_of_each_model.sort.first
    end

    # a string of the array of the count of (klass) objects
    # along the date_range, on every displayed interval
    def resources_by_date(klass_name)
      klass       = klass_name.to_s.constantize
      created_ats = klass.pluck(:created_at).compact.map(&:to_date)

      date_range.step(date_steps).map do |date|
        created_ats.count{|c_a| c_a < date}
      end.to_s
    end

    private

    # range of dates shown on the graph (array of days)
    def date_range
      @date_range ||= first_day_ever.to_date..Date.today
    end

    def first_day_of_each_model
      StatBoard.models.map { |m| first_day_of(m) }
    end

    # returns the earliest `created_at` of a given class
    # returns `Time.now` if none is available
    def first_day_of(klass_name)
      klass = klass_name.to_s.constantize
      klass.order("created_at ASC").first.try(:created_at) || Time.now
    end

  end
end
