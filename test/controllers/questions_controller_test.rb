require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  test 'index : assigns all questions' do
    get :index
    assert_not_nil assigns(:questions)
  end

  test 'show : assigns question with right id' do
    q = Question.create();
    q.save

    get :show, id: q.id
    assert assigns(:question).id
  end

  test 'new : assigns new object of question' do
    get :new
    assert_instance_of Question, assigns(:question)
  end

end
