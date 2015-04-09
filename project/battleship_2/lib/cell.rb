class Cell < ActiveRecord::Base
  belongs_to :ocean
  belongs_to :ship
end

# when you get a chance start to incorporate validations
