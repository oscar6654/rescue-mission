class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :description, :question_id
end
