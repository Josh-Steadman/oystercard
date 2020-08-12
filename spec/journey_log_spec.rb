require 'journey_log'

describe JourneyLog do
  let(:first_station) { double :first_station }
  let(:second_station) { double :second_station }
  let(:trip) { double :trip }
  let(:journey_class) { double :journey_class, new: trip}

  it { is_expected.to respond_to :start }
  it { is_expected.to respond_to :finish }
  it { is_expected.to respond_to :journeys }
  

  describe '#initialize' do
    it 'has a Journey class' do
      journey = JourneyLog.new(trip)
      expect(journey.journey_class).to eq trip
    end
  end

  describe '#start' do
    it 'has an entry station' do
      subject.start(first_station)
      expect(subject.entry_station).to eq first_station
    end
  end

  describe '#current_journey' do
    xit 'returns an incomplete journey if no exit' do
       subject.start(first_station)
       subject.finish
       expect(subject.current_journey).to include({:entry_station => first_station})
    end

  end

  
end


