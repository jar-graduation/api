class Level < ActiveRecord::Base

  has_many :question_levels
  has_many :questions, through: :question_levels

  validates :year, presence: :true
  validates :value, presence: :true, uniqueness: :true

end
