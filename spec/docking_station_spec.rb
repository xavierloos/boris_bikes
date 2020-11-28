require "DockingStation"
describe DockingStation do
  # it "respond to the method release_bike" do
  #   expect(subject).to respond_to :release_bike
  # end
  it { is_expected.to respond_to :release_bike } #One line syntax
  # a) gets a bike, and then b) expects the bike to be working
  it "release a bike and expect to be working" do
    bike = subject.release_bike
    expect(bike).to be_working
  end
  it "expect a bike to be returned to the station" do
    expect(subject).to respond_to(:station).with(1).argument
  end
  it "puts a bike to the station" do
    bike = Bike.new
    subject.station(bike)
    expect(subject.bike).to eq(bike)
  end
end
