class Deck < ActiveRecord::Base
  has_many :cards, dependent: :destroy
  validates :category, presence: true

  def to_s
    return "Category of Deck: #{category}"
  end

end
# looks good
