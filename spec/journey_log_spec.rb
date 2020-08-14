require 'journey_log'

describe JourneyLog do
  let(:first_station) { double :first_station }
  #let(:second_station) { double :second_station }
  let(:journey) { double :journey }
  let(:journey_class) { double :journey_class, new: journey}
  subject {described_class.new(journey_class: journey_class)}

  it { is_expected.to respond_to :start }
  it { is_expected.to respond_to :finish }
  it { is_expected.to respond_to :journeys }
  
describe '#start' do
    it 'starts a journey' do
      expect(journey_class).to receive(:new).with(entry_station: first_station)
      subject.start(first_station)
     
    end
  end

  

  
end


