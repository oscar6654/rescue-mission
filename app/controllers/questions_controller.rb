class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end
  def new
    @question = Question.new
  end
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: "Succesfully Created"
    else
      render action: 'new'
    end
  end
  def destroy
    @questions = Question.find(params[:id])
    @questions.destroy
    redirect_to "/questions", notice: "Deleted Succesfully"
  end
  def edit
    @question_edit = Question.find(params[:id])
  end
  def update
    @question_edit = Question.find(params[:id])
    if @question_edit.update_attributes(question_edit_params)
      redirect_to @question_edit, notice: "Updated Succesfully"
    else
      render action: 'edit'
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
  def question_edit_params
    params.require(:question).permit(:title, :description)
  end
end
