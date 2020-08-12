
class Journey
    attr_reader :entry_station
    def initialize(entry_station= nil)
       @entry_station = entry_station
    end
    PENALTY_FARE = 6 
   
    def end_journey
    
    end

    def fare
      PENALTY_FARE
    end

    def journey_complete

    end
end