require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  test "index returns success" do
    get :index
    assert_response :success
  end

  test "index assigns questions" do
    get :index
    assert_not_nil assigns(:questions)
  end

end
