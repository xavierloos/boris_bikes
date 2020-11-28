require "DockingStation"
describe DockingStation do
  # it "respond to the method release_bike" do
  #   expect(subject).to respond_to :release_bike
  # end
  it { is_expected.to respond_to :release_bike } #One line syntax
  # a) gets a bike, and then b) expects the bike to be working
  # it "release a bike and expect to be working" do
  #   bike = subject.release_bike
  #   expect(bike).to be_working
  # end
  it "expect a bike to be returned to the station" do
    expect(subject).to respond_to(:dock).with(1).argument
  end
  it "puts a bike to the station" do
    bikes = Bike.new
    subject.dock(bikes)
    expect(subject.bikes).to eq(bikes)
  end
  describe "release_bike" do
    it "raise an error if the dock doesn't have a bike" do
      expect { subject.release_bike }.to raise_error "Dock empty"
    end
  end
  describe "dock" do
    it "raise an error if the dock is full and user want to dock a bike" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error "Dock full"
    end
  end
end
