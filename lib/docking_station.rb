
require_relative './bike.rb'

class DockingStation
  
   DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end
  
  def dock_bike(bike)
    # Use fail or raise to raise an error
    fail "Station Full" if full?
    bikes << bike
  end

  def release_bike
    fail "No bikes available" if empty?
    bikes.pop
  end

  private

  attr_reader :bikes
  def full?
    bikes.size >= capacity
  end
  def empty?
    bikes.empty?
  end
end
