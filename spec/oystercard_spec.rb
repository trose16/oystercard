
require 'oystercard'

describe Oystercard do

  it 'has initial balance of 0' do
    expect(subject.money).to eq 0
  end

  it 'checks card for balance' do
    expect(subject).to respond_to(:balance)
  end


end
