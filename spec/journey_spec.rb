require 'journey'
describe Journey do
    let(:first_station) { double :first_station }
    let(:second_station)  { double :second_station }
    describe '#initialize' do
      it 'starts the journey' do
         journey = Journey.new(first_station)
         expect(journey.entry_station).to eq first_station
      end
    end

    describe '#fare' do
      it 'will return penalty fair as default' do
        expect(subject.fare).to eq Journey::PENALTY_FARE
      end
    end

end