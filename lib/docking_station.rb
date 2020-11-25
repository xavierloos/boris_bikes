require_relative './bike.rb'
<<<<<<< HEAD
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
=======
<<<<<<< HEAD

=======
>>>>>>> cdf5327980a0e0980f0d3244260790644d4734f8
class DockingStation 

  #def initialise
  #end

  def release_bike
    bike = Bike.new
<<<<<<< HEAD
=======

>>>>>>> cdf5327980a0e0980f0d3244260790644d4734f8
>>>>>>> 696ad8dfe7ea78666c3b71a4a180c1623ca739e5
  end
end