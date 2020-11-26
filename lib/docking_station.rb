require_relative './bike.rb'

class DockingStation
  attr_reader :bike

  def release_bike
    fail "No bikes available" if @bike == nil
    @bike
  end

  def dock_bike(bike)
    @bike = bike
  end
end
