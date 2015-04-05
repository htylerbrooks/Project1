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

  #
  # def to_s
  #   return name
  # end

end


binding.pry
