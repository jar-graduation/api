class CreateQuestionLevels < ActiveRecord::Migration
  def change
    create_table :question_levels do |t|
      t.integer :question_id
      t.integer :level_id
    end
  end
end
