class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|

      t.string :title, default: "", null: false
      t.text :description, default: "", null: false
      t.string :registration_link, default: "", null: false
      t.string :more_information_link, default: "", null: false

      t.timestamps null: false
    end
  end
end
