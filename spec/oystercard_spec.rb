require 'oystercard'
describe Oystercard do

  describe '#initialize' do
    it "oystercard balance is initialized to 0" do
        expect(subject.balance).to eq 0
    end

    it "provides an empty journey log as default" do
      expect(subject.journey_log).to be_empty
      end
  end

  describe '#top_up' do
    it 'increases balance by amount when called' do
        
      expect { subject.top_up(10) }.to change { subject.balance }.by(10)
    end

    it 'raises an error if amount exceeds max balance' do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect { subject.top_up(1) }.to  raise_error ("DENIED: Max balance is #{max_balance}")
    end
  end

  describe '#deduct' do 
    let(:exit_station) { double :station }
    it 'deduct balance on oyster card when called' do
        subject.top_up(15)
       expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-1)
    end 
  end
  
  
  it 'initialy is not in journey' do
        expect(subject).not_to be_in_journey
     end
  
   describe '#touch_in' do
   let(:entry_station) { double :station }
   it "card remebers station where it touched in" do
    subject.top_up(5)
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq entry_station

  end  
   
   it "updates journey to true" do
        subject.top_up(5)
        subject.touch_in(entry_station)
        expect(subject).to be_in_journey  
    end

    it "raises an error if not enough money on card" do
        minimum_amount = Oystercard::MINIMUM_AMOUNT
        expect{subject.touch_in(entry_station)}.to raise_error "not enough money to travel."
      end
 end

    describe '#touch_out' do
    let(:entry_station) { double :station }
    let(:exit_station) { double :station }
       it 'updates journey to false' do
        subject.top_up(5)
         subject.touch_in(entry_station)
         subject.touch_out(exit_station)
         expect(subject).not_to be_in_journey
       end

       it 'stores exit station' do
        subject.top_up(10)
        subject.touch_in(entry_station)
        subject.touch_out(exit_station)
        expect(subject.exit_station).to eq exit_station
        end

        it "decreases balance by 1" do
            subject.top_up(5)
            subject.touch_in(entry_station)
            expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-1)
        end

        it 'creates a complete journey' do
            subject.top_up(5)
            subject.touch_in(entry_station)
            subject.touch_out(exit_station)
            expect(subject.journey_log).to include({:entry_station => entry_station, :exit_station => exit_station})
        end
    end

end
