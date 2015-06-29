class AddYearAndMonthToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :number_of_year, :string
    add_column :courses, :number_of_season, :string
  end
end
