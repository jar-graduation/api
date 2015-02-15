class AddValueToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :value, :string
  end
end
