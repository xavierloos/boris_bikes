require "../lib/docking_station"

describe DockingStation do

  describe "#release_bike" do
    it "releases a working bike when a bike is available" do
      original_bike = Bike.new
      station = DockingStation.new
      station.dock_bike(original_bike)
      new_bike = station.release_bike
      expect(new_bike.working?).to be true
    end
    it "returns an error when called on an empty docking station" do
      expect {DockingStation.new.release_bike}.to raise_error("No bikes available")
    end
  end

  describe "#dock_bike" do
    it "docks a bike" do
      a_bike = Bike.new
      subject.dock_bike(a_bike)
      expect(subject.bike).to eql(a_bike)
    end
  end
end
