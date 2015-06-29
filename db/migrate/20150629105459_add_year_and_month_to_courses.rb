class AddYearAndMonthToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :year, :string
    add_column :courses, :month, :string
  end
end
