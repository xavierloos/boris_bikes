require_relative './bike.rb'

class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20
  

  def initialize
    @bikes = []
  end
  
  def release_bike
    fail "No bikes available" if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    # Use fail or raise to raise an error
    fail "Station Full" if full?
    @bikes << bike
  end
  private
  def full?
    @bikes.size >= DEFAULT_CAPACITY
  end
  def empty?
    bikes.empty?
  end
end
