class Course < ActiveRecord::Base

  has_many :registration_forms
  has_many :registers , through: :registration_forms, source: :register


  def self.generateNameList
    return self.order(id: :asc).map {|c| [c.name, c.id] }
  end

end
