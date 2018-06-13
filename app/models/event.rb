class Event
  attr_accessor :date

  def initialize(date)
    @date = date
  end

  def start_time
    @date
  end
end
