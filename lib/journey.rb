
class Journey
    attr_reader :entry_station
    def initialize(entry_station=nil)
       @entry_station = entry_station
    end
    PENALTY_FARE = 6 
   
    def end_journey(exit_station= nil)
      @exit_station = exit_station
    end

    def fare
     @exit_station == nil ? PENALTY_FARE : 1
    end

    def journey_complete?
      @entry_station && @exit_station
    end
end