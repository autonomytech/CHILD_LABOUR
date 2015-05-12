class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :child

  def question_
    question.question
  end
end
