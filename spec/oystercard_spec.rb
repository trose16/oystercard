
require 'oystercard'

describe Oystercard do

  it 'has initial balance of 0' do
    expect(subject.balance).to eq 0
  end

  it 'checks card for balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'allows user to add money' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it 'allows top_up to increase the balance' do
    amount = 10
    expect(subject.top_up(amount)).to eq(subject.balance)
  end

  it 'raise an error if balance exceeds 90' do
    subject.top_up(90)
    expect{subject.top_up(1)}.to raise_error("Card exceeds 90!")
  end

end
