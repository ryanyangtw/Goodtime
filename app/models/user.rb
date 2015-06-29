class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  # validates_confirmation_of :password

  has_many :registration_forms
  has_many :courses , through: :registration_forms

  validates_presence_of :password_confirmation, :name, :nickname, :phone_number, :address_country, :address_district, :birthday_year, :birthday_month, :birthday_date
  # :email, :password, :provider, :uid, :name, :nickname, :phone_number, :address_country, :address_district, :birthday_year, :birthday_month, :birthday_date

  def self.from_omniauth(auth)
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    return user
  end

  def register_from_fb?
    self.provider == "facebook"
  end


  def create_token!
    self.update_columns(token: generate_token)
  end

  def destroy_token!
    self.update_columns(token: nil)
  end

  def created_today?
    self.created_at.to_date == Date.today
  end

  def change_role
    self.update_columns(admin: !self.admin)
  end


  private

  def generate_token 
    loop do
      token =  SecureRandom.urlsafe_base64
      # self.token = token
      break token unless self.class.find_by(token: token)
      # break token unless User.find_by(token: token)
    end
    # self.token = SecureRandom.urlsafe_base64
  end
  
end
