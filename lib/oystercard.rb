class Oystercard
  attr_reader :balance
  attr_reader :in_journey
  alias :in_journey? :in_journey

  MAX_BALANCE = 100
  
  def initialize 
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    raise "Sorry Maximum Balance is #{ MAX_BALANCE } " if @balance + value > MAX_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def touch_in
    @in_journey = true
  end
 
  def touch_out
    @in_journey = false
  end
end

