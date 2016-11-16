
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

  it 'raises an error if balance exceeds 90' do
    subject.top_up(90)
    expect{subject.top_up(1)}.to raise_error("Card exceeds 90!")
  end

  it 'deducts spent money' do
    expect{subject.deduct(1)}.to change{subject.balance}
  end

  it 'tracks a users journey' do
    expect(:in_journey?).to be_truthy
  end

  it 'knows if a user has touched in' do
    expect(subject.touch_in).to be_truthy
  end

end
