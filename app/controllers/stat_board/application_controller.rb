module StatBoard
  class ApplicationController < ActionController::Base

    private

    helper_method :date_steps, :first_day_ever, :resources_by_date

    def date_steps
      @date_steps ||= date_range.count / [date_range.count, 50].min
    end

    def first_day_ever
      @first_day_ever ||= first_day_of_each_model.sort.first
    end

    def resources_by_date(klass_name)
      klass       = klass_name.to_s.constantize
      created_ats = klass.pluck(:created_at).map(&:to_date)

      date_range.step(date_steps).map do |date|
        created_ats.count{|c_a| c_a < date}
      end.to_s
    end

    def first_day_of_each_model
      StatBoard.models.map { |m| first_day_of(m) }
    end

    def first_day_of(klass_name)
      klass = klass_name.to_s.constantize
      klass.order("created_at ASC").first.try(:created_at) || Time.now
    end

    def date_range
      @date_range ||= first_day_ever.to_date..Date.today
    end

  end
end
