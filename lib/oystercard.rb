class Oystercard
  attr_reader :balance
  attr_reader :in_journey
  alias :in_journey? :in_journey

  MAX_BALANCE = 100
  MIN_BALANCE = 1

  def initialize 
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    raise "Sorry Maximum Balance is #{ MAX_BALANCE } " if @balance + value > MAX_BALANCE
    @balance += value
  end

  def touch_in
    raise "Sorry not enough credit to travel, Min is #{ Oystercard::MIN_BALANCE } " if @balance < 1
    @in_journey = true
  end
 
  def touch_out
    self.deduct(1)
    @in_journey = false
  end

  private

  def deduct(value)
    @balance -= value
  end

end

#need to access private method from rspec????