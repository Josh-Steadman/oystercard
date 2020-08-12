require 'station'
describe Station do
    hackney = Station.new('hackney', 2)
  describe  '#initialize' do
    it 'generates the name of the station' do
        expect(hackney.station_name).to eq 'hackney'
    end
  end

end