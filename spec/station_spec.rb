require 'station'

describe Station do

  let(:station_name) {double(:station_name)}

  context 'when initializing' do
    it 'has a station name' do
    station = Station.new("London bridge", "zone 1")
    expect(station.station_name).to eq("London bridge")
    end

    it 'has a zone' do
    station = Station.new("London bridge", "zone 2")
    expect(station.zone).to eq("zone 2")
    end
  end
end
