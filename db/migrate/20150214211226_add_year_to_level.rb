class AddYearToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :year, :int
  end
end
