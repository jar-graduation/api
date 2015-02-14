require 'test_helper'

class LevelTest < ActiveSupport::TestCase

  test 'level : year : presence' do
    level = Level.new
    level.valid?
    assert_not_nil level.errors.get(:year)
  end

  test 'level : value : presence' do
    level = Level.new
    level.valid?
    assert_not_nil level.errors.get(:value)
  end

  test 'level : value : uniqueness' do
    Level.create(year: 1, value: 'test')

    level2 = Level.new(value: 'test')
    level2.valid?
    assert_not_nil level2.errors.get(:value)
  end

end
