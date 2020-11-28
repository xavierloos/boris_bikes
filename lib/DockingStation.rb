#complements the builtin method require by allowing you to load a file that is relative to the file containing the require_relative statement.
require_relative "Bike"

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "Dock empty" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Dock full" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.empty?
  end
end
