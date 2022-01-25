class Oystercard
  attr_reader :balance
  MAX_BALANCE = 100
  
  def initialize 
    @balance = 0
  end

  def top_up(value)
    raise "Sorry Maximum Balance is #{ MAX_BALANCE } " if @balance + value > MAX_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end
end

