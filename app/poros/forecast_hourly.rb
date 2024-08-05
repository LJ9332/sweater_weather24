class ForecastHourly 
  attr_reader :time,
              :temperature,
              :conditions,
              :time
  
  def initialize(data)
    @time = data[:time]
    @temperature = data[:temperature]
    @conditions = data[:conditions]
    @icon = data[:icon]
  end
end