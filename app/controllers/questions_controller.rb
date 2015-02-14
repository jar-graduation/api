class QuestionsController < ApplicationController
  before_action :set_question, only: [:show]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
