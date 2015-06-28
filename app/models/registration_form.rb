class RegistrationForm < ActiveRecord::Base
  belongs_to :register, class_name: "User", foreign_key: :user_id
  belongs_to :course, class_name: "Course"
end
