require 'journey'

describe Journey do


  it 'tracks a users journey' do
    expect(:in_journey?).to be_truthy
  end

  it 'tracks entry station when starting journey' do
    expect(subject.journey_start("Aldgate")).to eq "Aldgate"
  end

  it 'tracks exit station' do
    expect(subject.journey_end("London Bridge")).to eq "London Bridge"
  end

  it 'knows when a journey is complete' do
    subject.journey_start("Aldgate")
    subject.journey_end("Kings Cross")
    expect(subject.journey_complete?).to eq true
  end

  it 'charges minimum fare for one complete journey' do
    subject.journey_start("Aldgate")
    subject.journey_end("Kings Cross")
    expect(subject.fare).to eq (Oystercard::MINIMUM)
  end

  it 'charges a £6 penalty fare for incomplete journey' do
    subject.journey_start(nil)
    subject.journey_end("Aldgate")
    expect(subject.fare).to eq (Journey::PENALTY)
  end



end
