#complements the builtin method require by allowing you to load a file that is relative to the file containing the require_relative statement.
require_relative "Bike"

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
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
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end
end
