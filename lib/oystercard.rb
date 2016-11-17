require_relative 'station'

class Oystercard

  attr_reader :balance, :journey, :entry_station, :exit_station, :journey_list

  CARD_LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance = 0
    @travelling = false
    @journey_list = []
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
    @travelling
  end

  def touch_in(station)
    @entry_station = station
    raise "Insufficient funds please top up" if @balance < MINIMUM
    @travelling = true
  end

  def touch_out(station)
    @exit_station = station
    @journey = {:start => @entry_station, :end => @exit_station}
    @journey_list << @journey
    @travelling = false
  end


end
