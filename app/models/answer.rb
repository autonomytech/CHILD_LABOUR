class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :child_labour

  def question_
    question.question
  end
end
