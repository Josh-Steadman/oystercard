require 'journey'
describe Journey do
    let(:first_station) { double :first_station }
    let(:second_station)  { double :second_station }

    it 'is originally not on a journey' do
        expect(subject).not_to be_journey_complete
    end

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

    describe '#end_journey' do
      it 'when journey ends regular fare is deducted' do
        journey = Journey.new(first_station)
        journey.end_journey(second_station)
        expect(journey.fare).to eq 1
      end
    end

    describe '#journey_complete?' do
      it 'journey starts on initialization' do
        journey = Journey.new(first_station)
        journey.end_journey(second_station)
        expect(journey).to be_journey_complete
      end
    end

end