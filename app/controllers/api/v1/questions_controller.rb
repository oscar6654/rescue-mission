class Api::V1::QuestionsController < ActionController::Base
    def index
        # render json: questions: { QuestionSerializer.new(Question.all) }
        render json: Question.all
    end
end
