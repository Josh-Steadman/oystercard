 require_relative 'station'
 require_relative 'journey'
class Oystercard

    attr_reader :balance, :entry_station, :exit_station, :journey_log
  
    def initialize
      @balance = 0
      @journey_log = []
      
    end
  
      MAX_BALANCE = 90
      MINIMUM_AMOUNT = 1
  
    def top_up(amount)
      fail "DENIED: Max balance is #{MAX_BALANCE}" if balance + amount > MAX_BALANCE
      @balance += amount
      @balance
    end
  
    def in_journey?
      @entry_station != nil
    end
  
    def touch_in(entry_station)
      fail "not enough money to travel." if @balance < MINIMUM_AMOUNT
      @entry_station = entry_station
      @journey = Journey.new(entry_station)
     
    end
  
    def touch_out(exit_station= nil)
      @exit_station = exit_station
      record_journey
      @journey.end_journey(exit_station)
      deduct(@journey.fare)
      @entry_station = nil
      
    end
  
  private
  def deduct(amount)
    @balance -= amount
    #@balance
  end

  def record_journey
    @journey_log.push(:entry_station => entry_station, :exit_station => exit_station)
  end

end
  