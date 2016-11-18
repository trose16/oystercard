
require 'oystercard'

describe Oystercard do

  let(:station) {double(:station)}
  let(:station2) {double(:station)}
  subject(:card) {described_class.new}

  describe "Topped up" do

    before do
      card.top_up(20)
    end

      context "Does the class respond to these methods" do

          it 'checks card for balance' do
            expect(card).to respond_to(:balance)
          end

          it 'allows user to add money' do
            expect(card).to respond_to(:top_up).with(1).argument
          end
      end

      context "Does the balance feature work as intended" do

          it 'raises an error if balance exceeds 90' do
            card.top_up(70)
            expect{subject.top_up(1)}.to raise_error("Card exceeds 90!")
          end

      end

      # it 'tracks a users journey' do
      #   expect(:in_journey?).to be_truthy
      # end

      context "when the user touches in" do

          it 'expect true' do
            expect(card.touch_in(station)).to eq true
          end
          it 'tracks entry station' do
            card.touch_in(station)
            expect(card.entry_station).to eq station
          end

      end

      context "when the user touches out" do

           it 'knows if a user has touched out' do
             expect(card.touch_out(station)).to eq false
           end

          it 'tracks exit station' do
            subject.touch_out(station)
            expect(card.exit_station).to eq station
          end

          it 'tracks their full journey' do
            card.touch_in(station)
            card.touch_out(station2)
            expect(subject.journey).to eq({:start => station, :end => station2})
          end

          it 'saves a list of all user journeys' do
            3.times{card.touch_in(station)}
            3.times{card.touch_out(station2)}
            expect(subject.journey_list).to eq([{:start => station, :end => station2},{:start => station, :end => station2},{:start => station, :end => station2}])
          end

      end
 end

describe "Not topped up" do

        context "When the class intializes with" do
            it 'has initial balance of 0' do
              expect(subject.balance).to eq 0
            end

            it 'starts with an empty list of journeys' do
            expect(subject.journey_list).to eq([])
            end

        end
      end

    context "Does the balance feature work as intended" do

        it 'deducts spent money' do
          expect{subject.deduct(1)}.to change{subject.balance}
      end
     end

     context "it raises an error when" do

         it 'has a balance less than 1' do
         expect{subject.touch_in(station)}.to raise_error("Insufficient funds please top up")
         end
     end

end
