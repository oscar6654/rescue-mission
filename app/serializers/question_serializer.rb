class QuestionSerializer < ActiveModel::Serializer
  has_many :answers
  attributes :id, :title, :description

  def answer_title
    object.answers.where(question_id: :id)
  end
end
