require "../lib/docking_station"

describe DockingStation do
  describe "#release_bike" do
    it "releases a working bike" do
      bike = subject.release_bike
      expect(bike.working?).to be true
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