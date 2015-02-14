class Question < ActiveRecord::Base
  before_validation :set_answer_type

  def set_answer_type
    self.answer_type = 'open'
  end

end
