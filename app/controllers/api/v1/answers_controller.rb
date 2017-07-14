class Api::V1::AnswersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: Question.all, adapter: :json
  end
  def show
    @question = Question.find(params[:id])
    render json: @question.answers
  end
  def create
    data = JSON.parse(request.body.read)
    new_answer = Answer.create(description: data["description"], question_id: data["question_id"])
    # new_answer = Answer.create(description: "Hello",question_id: 3)
    # new_gif = Gif.create(name: data["name"], url: data["url"], likes: 0)
    render json: new_answer
  end

end
