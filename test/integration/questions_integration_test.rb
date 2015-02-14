require 'test_helper'

class QuestionsIntegrationTest < ActionDispatch::IntegrationTest

  setup do
    @question = Question.create!
  end

  test 'route : questions' do
    get '/questions.json'
    assert_response :success
  end

  test 'route : questions/{id}' do
    get "/questions/#{@question.id}.json"
    assert_response :success
  end

  test 'questions : count' do
    get '/questions.json'
    assert_equal 1, json.count
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

  test 'question : image_url' do
    @question.image_url = 'www.test.com/img.png'
    @question.save

    get "/questions/#{@question.id}.json"

    assert_equal @question.image_url, json['image_url']
  end

  test 'question : calculator_allowed : default false' do
    get "/questions/#{@question.id}.json"
    assert_equal false, json['calculator_allowed']
  end

  test 'question : calculator_allowed' do
    @question.calculator_allowed = true;
    @question.save

    get "/questions/#{@question.id}.json"

    assert_equal true, json['calculator_allowed']
  end

  test 'question : answer_type : default open' do
    get "/questions/#{@question.id}.json"
    assert_equal 'open', json['answer_type']
  end

  def json
    @json ||= JSON.parse(response.body)
  end

end
