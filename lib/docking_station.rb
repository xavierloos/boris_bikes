require_relative './bike.rb'
class DockingStation
  attr_reader :bike 
  attr_reader :docking_station
  def initilize
    @docking_station =[]
  end
  
  def release_bike
    @bike = Bike.new
  end
  def station(bike)
    @docking_station << bike
  end
end