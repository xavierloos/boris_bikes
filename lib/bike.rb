class Bike 
  attr_accessor :broken_bikes
  
  def initialize
    @broken_bikes = []
  end

  def working?
    if true
      @bikes << bike
    else
      @broken_bikes << bike
    end

end