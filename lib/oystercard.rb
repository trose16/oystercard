class Oystercard

  attr_reader :money, :balance

  CARD_LIMIT = 90

  def initialize
    # @money = money
    @balance = 0
  end

  def top_up(amount)
    raise "Card exceeds 90!" if @balance >= CARD_LIMIT
    @balance += amount
    # add the top_up value to the @balance value
  end

end
