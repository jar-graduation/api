class AddNameToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :name, :string
  end
end
