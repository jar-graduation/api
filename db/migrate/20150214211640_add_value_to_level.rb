class AddValueToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :value, :string
  end
end
