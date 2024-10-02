module Decorators
  class DailyDataDecorator
    def initialize(data, date_param)
      @data = data
      @date_param = date_param
    end

    def decorate
      date = get_date_from_param

      placeholder_data = ('01'..Time.days_in_month(date.month).to_s).to_a.index_with(nil)
      placeholder_data.merge!(@data)
    end

    private

    def get_date_from_param
      @date_param.present? ? Date.strptime(@date_param, '%Y-%m') : Date.current
    end
  end
end