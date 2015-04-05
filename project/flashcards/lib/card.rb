class Card < ActiveRecord::Base
  belongs_to :deck
  validates :question, presence: true
  validates :answer, presence: true

  def to_s
    return " ID: #{id} - Question: #{question} - Answer: #{answer}"
  end
end
