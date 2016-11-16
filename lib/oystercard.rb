class Oystercard

  attr_reader :money, :balance, :journey

  CARD_LIMIT = 90

  def initialize
    @balance = 0
    @journey = true
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
    @journey
  end

end
