require "../lib/docking_station"

describe DockingStation do

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock_bike(bike)
      end
      expect{ subject.dock_bike(bike) }.to raise_error 'Station Full'
    end
  end
  describe "#release_bike" do
    let(:bike) { double :bike }
    it "releases a working bike when a bike is available" do
      original_bike =  bike #Bike.new
      station = DockingStation.new
      station.dock_bike(original_bike)
      new_bike = station.release_bike
      allow(new_bike).to receive(:working?).and_return(true)
      expect(new_bike).to be original_bike
    end
    it "will not release a broken bike" do
      original_bike = double(:bike, broken?: true)
      station = DockingStation.new
      station.dock_bike(original_bike)
      new_bike = station.release_bike
      allow(new_bike).to receive(:broken?).and_return(true)
      expect(new_bike).to be original_bike
    end
    it "returns an error when called on an empty docking station" do
      expect {DockingStation.new.release_bike}.to raise_error("No bikes available")
    end
  end

  # describe "#dock_bike" do
  #   it "docks a bike" do
  #     a_bike = Bike.new
  #     subject.dock_bike(a_bike)
  #     expect(subject.bikes).to include(a_bike)
  #   end
    # Write RSpec tests that expect errors
    # it "returns an error when called on a docking station with >20 bikes" do
    #   full_docking = DockingStation.new(50)
    #   50.times{full_docking.dock_bike(Bike.new)}
    #   expect{full_docking.dock_bike(Bike.new)}.to raise_error("Station Full")
    # end
  # end
end