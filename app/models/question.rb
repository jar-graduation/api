class Question < ActiveRecord::Base
  before_validation :set_answer_type

  has_many :question_levels
  has_many :levels, through: :question_levels

  validates :value, presence: :true

  def set_answer_type
    self.answer_type = 'open'
  end

end
