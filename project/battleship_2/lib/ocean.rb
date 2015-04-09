require 'pry'
class Ocean < ActiveRecord::Base
  has_many :ships,  dependent: :destroy
  has_many :cells,   dependent: :destroy

  def cell_creation
    x = ["A","B","C","D","E","F","G","H","I","J"]
    y = [0,1,2,3,4,5,6,7,8,9]

    x.each_with_index do |a|
      y.each do |b|
        self.cells.create(x:a, y:b)
      end
    end
    cells
  end
  # in line 10 you use an each_with_index enumerable but don't use the index as an iteratee, so you can just use the each method there
  # other than that the cell_creation method looks great to develop the grid for the game


  # def ship_creation
  #   # create 4 possible ships (one in each direction)
  #   ship_start_point = [rand (10) , rand (10)]
  #   ship_end_point = []
  #   ship_end_point  << [ ship_start_point[0] + 5, ship_start_point[1]]
  #   ship_end_point  << [ ship_start_point[0] , ship_start_point[1] + 5]
  #   ship_end_point  <<  [ ship_start_point[0] - 5, ship_start_point[1]]
  #   ship_end_point  <<  [ ship_start_point[0] , ship_start_point[1]- 5]
  #
  #   # select the first ship that is within the board
  #   correct_ship_end_points = ship_end_point.select{|array| array[0] >= 0 && array[1] > = 0 }
  #
  #   ship_end_point = correct_ship_end_point.sample
  #
  # end
# i think we made real progress here. When you have some time, you can figure this problem out.
# i think you're really close at placing ships with this method. You could always just hard code ship positions and work from there as well.


  #
  # def to_s
  #   return name
  # end

end


binding.pry
# take out binding.pry in your final form
