class JourneyLog
  attr_reader :journey_class, :entry_station
  
  def initialize(journey_class = Journey.new)
    @journey_class = journey_class
  end

  def start(entry_station)
    @entry_station = entry_station
  end
  
  def finish
    
  end

  def journeys
  end

  private
  def current_journey
  end
end