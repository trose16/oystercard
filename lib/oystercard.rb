class Oystercard

  attr_reader :balance, :journey

  CARD_LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(amount)
    raise "Card exceeds 90!" if @balance >= CARD_LIMIT
    @balance += amount
    # add the top_up value to the @balance value
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @journey
  end

  def touch_in
    raise "Insufficient funds please top up" if @balance < MINIMUM
    @journey = true
  end

  def touch_out
    @journey = false
  end

end
