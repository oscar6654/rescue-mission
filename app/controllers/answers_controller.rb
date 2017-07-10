class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to '/questions', notice: "Answer Submitted"
    else
      redirect_to '/questions', notice: "Answer Not Submitted"
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:description)
  end
end
