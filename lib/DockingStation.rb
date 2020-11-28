#complements the builtin method require by allowing you to load a file that is relative to the file containing the require_relative statement.
require_relative "Bike"

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "Dock empty" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Dock full" if @bikes.count >= 20
    @bikes << bike
  end
end
