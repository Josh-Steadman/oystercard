require 'journey_log'

describe JourneyLog do
  let(:station) { double :station, zone: 1}
  let(:journey) { double :journey }
  let(:journey_class) { double :journey_class}

  describe '#initialize' do
    xit 'has a Journey class' do
      expect(subject.journey_class).to be_instance_of journey
    end
  end

  it { is_expected.to respond_to start}
  it { is_expected.to respond_to finish}
  it { is_expected.to respond_to journeys}
  
end


