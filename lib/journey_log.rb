require_relative 'journey'
class JourneyLog
  attr_reader :journey_class, :entry_station
  
  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    @entry_station = entry_station
    @journey_class.new(entry_station: entry_station)
    
  end
  
  def finish
    
  end

  def journeys
  end

  private
  def current_journey
  end
end