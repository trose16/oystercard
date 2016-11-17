
require 'oystercard'

describe Oystercard do

  context "when the class intializes with" do

      it 'has initial balance of 0' do
        expect(subject.balance).to eq 0
      end

  end

  context "Does the class respond to these methods" do

      it 'checks card for balance' do
        expect(subject).to respond_to(:balance)
      end

      it 'allows user to add money' do
        expect(subject).to respond_to(:top_up).with(1).argument
      end
  end

  context "Does the balance feature work as intended" do

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
  end

  it 'tracks a users journey' do
    expect(:in_journey?).to be_truthy
  end

  context "when the user touches in" do

      it 'expect true' do
        subject.top_up(50)
        expect(subject.touch_in).to eq true
      end
  end

  context "when the user touches out" do

      it 'knows if a user has touched out' do
        expect(subject.touch_out).to eq false
      end
  end

  context "it raises an error when" do

      it 'has a balance less than 1' do
      expect{subject.touch_in}.to raise_error("Insufficient funds please top up")
      end
  end


end
