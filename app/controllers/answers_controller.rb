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
  
  def edit
    # @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    # binding.pry
  end
  def update
    # @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    # binding.pry
    if @answer.update_attributes(answer_params)
      redirect_to '/questions', notice: "Answer Updated"
    else
      redirect_to '/questions', notice: "Answer Not Updated"
    end
  end
  private
  def answer_params
    params.require(:answer).permit(:description)
  end
end
