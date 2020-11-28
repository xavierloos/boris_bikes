#complements the builtin method require by allowing you to load a file that is relative to the file containing the require_relative statement.
require_relative "Bike"

class DockingStation
  attr_reader :bike

  def release_bike
    Bike.new
  end

  def station(bike)
    @bike = bike
  end
end
