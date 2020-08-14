require_relative 'journey'
class JourneyLog
  attr_reader :journey_class, :entry_station, :journey_log
  
  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journey_log = []
    
  end

  def start(entry_station)
    @entry_station = entry_station
    journey = @journey_class.new(entry_station: entry_station)
    @journey_log.push(journey)
    current_journey
  end
  
  def finish
    
  end

  def journeys
  end

  private
  def current_journey
    if @entry_station != nil
      [{entry_station: entry_station}]
    end
    
  end
end