# noinspection ALL
class QuestionsController < ApplicationController
  before_action :set_question, only: [:show]

  def index
    @questions = Question.all
  end

  def show
  end

  def create
    if valid_request?

      @question = Question.new(question_params)

      if @question.save
        render action: 'show', status: :created
      else
        render json: @question.errors, status: :unprocessable_entity
      end

    end
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:value, :image_url, :calculator_allow, :answer_type)
  end

  def valid_request?
    error_message = nil

    if request.content_type != 'application/json'
      error_message = 'Content-Type needs to be application/json.'
    elsif params[:question].empty?
      error_message = 'No params given.'
    end

    if !error_message.nil?
      render json: error_message, status: :unprocessable_entity
      return false
    else
      return true
    end
  end

end

