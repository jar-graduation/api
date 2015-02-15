class AddCalculatorAllowedToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :calculator_allowed, :boolean, default: false
  end
end
