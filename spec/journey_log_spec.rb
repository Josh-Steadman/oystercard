require 'journey_log'

describe JourneyLog do
  let(:station) { double :station }
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
      subject.start(station)
      expect(subject.entry_station).to eq station
    end
  end
end


