require "DockingStation"
describe DockingStation do
  # it "respond to the method release_bike" do
  #   expect(subject).to respond_to :release_bike
  # end
  it { is_expected.to respond_to :release_bike } #One line syntax
end
