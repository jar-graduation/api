require 'test_helper'

class QuestionsIntegrationTest < ActionDispatch::IntegrationTest

  setup do
    @question = Question.create!
  end

  test 'route : questions' do
    get '/questions.json'
    assert_response :success
  end

  test 'questions : count' do
    get '/questions.json'
    assert_equal 1, json.count
  end

  test 'route : questions/{id}' do
    get "/questions/#{@question.id}.json"
    assert_response :success
  end

  test 'question : id' do
    get "/questions/#{@question.id}.json"
    assert_equal json['id'], @question.id
  end

  test 'question : value' do
    @question.value = 'Test'
    @question.save

    get "/questions/#{@question.id}.json"

    assert_equal @question.value, json['value']
  end

  def json
    @json ||= JSON.parse(response.body)
  end

end
