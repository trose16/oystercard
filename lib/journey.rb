#Journey is responsible for starting a journey and finishing, calculates the fare and returns if the journey is compete (tracking)
require_relative 'oystercard.rb'

class Journey

  attr_reader :entry_station, :exit_station

  PENALTY = 6

  def journey_start(station)#touch_in
      @entry_station = station
  end


  def journey_end(station)
      @exit_station = station
  end

  def journey_complete?
    @entry_station != nil && @exit_station != nil
  end

  def fare
    if journey_complete?
      Oystercard::MINIMUM
    else
      PENALTY
    end
  end

end
