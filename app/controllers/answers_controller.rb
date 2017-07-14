class AnswersController < ApplicationController

  # def new
  #   @question = Question.find(params[:question_id])
  #   # @answer = Answer.new
  # end
  def create
    @questions = Question.find(params[:question_id])
    @answer = @questions.answers.new(answer_params)
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
