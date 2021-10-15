class User < ApplicationRecord
  # Roles
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :rememberable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :omniauthable, omniauth_providers:[:facebook,:google_oauth2]
         
         
  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      name_and_surname = provider_data.info.name.split(' ')
      user.email = provider_data.info.email
      user.first_name = name_and_surname[0]
      user.last_name = name_and_surname[1]
      user.password = Devise.friendly_token[0,20]
    end
  end

  def set_default_role
    self.role ||= :user
  end

end 
