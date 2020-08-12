require 'journey_log'

describe JourneyLog do
  let(:station) { double :station, zone: 1}
  let(:journey) { double :journey, :station }
  let(:journey_class) { double :journey_class}

  describe '#initialize' do
    it 'has a Journey class' do
      expect(subject.journey_class).to be_instance_of journey
    end
  end
  
end