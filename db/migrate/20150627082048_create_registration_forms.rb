class CreateRegistrationForms < ActiveRecord::Migration
  def change
    create_table :registration_forms do |t|
      t.integer :user_id, index: true
      t.integer :course_id, index: true
      t.timestamps null: false
    end
  end
end
