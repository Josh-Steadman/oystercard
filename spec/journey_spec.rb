require 'journey'
describe Journey do
    let(:first_station) { double :first_station }
    let(:second_station)  { double :second_station }
    describe '#initialize' do
      it 'starts the journey' do
         expect(subject.entry_station).to eq first_station
      end
    end

end