class QuestionLevel < ActiveRecord::Base

  belongs_to :question
  belongs_to :level

end
