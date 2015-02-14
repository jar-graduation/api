require 'test_helper'

class QuestionLevelIntegrationTest < ActionDispatch::IntegrationTest

  setup do
    @question = Question.create(value: 'Test value')

    @level1 = Level.create(year: 1, value: 'VWO', name: '1VWO')
    @level2 = Level.create(year: 4, value: 'HAVO', name: nil)

    QuestionLevel.create(level_id: @level1.id, question_id: @question.id)
    QuestionLevel.create(level_id: @level2.id, question_id: @question.id)
  end

  test 'question : levels' do
    get "/questions/#{@question.id}.json"
    assert_equal @question.levels.size, json['levels'].size
  end

  test 'question : level : year' do
    get "/questions/#{@question.id}.json"

    assert_equal @level1.year, json['levels'][0]['year']
    assert_equal @level2.year, json['levels'][1]['year']
  end

  test 'question : level : value' do
    get "/questions/#{@question.id}.json"

    assert_equal @level1.value, json['levels'][0]['value']
    assert_equal @level2.value, json['levels'][1]['value']
  end

  test 'question : level : name' do
    get "/questions/#{@question.id}.json"

    assert_equal @level1.name, json['levels'][0]['name']
    assert_equal @level2.name, json['levels'][1]['name']
  end

end
