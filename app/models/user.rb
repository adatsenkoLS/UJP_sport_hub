class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  

  has_many :user_team
  has_many :team, through: :user_team

  # Roles
  
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      name_and_surname = provider_data.info.name.split(' ')
      user.email = provider_data.info.email
      user.first_name = name_and_surname[0]
      user.last_name = name_and_surname[1]
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def set_default_role
    self.role ||= :user
  end

  validates :first_name, presence: { message: 'Must be given' }, format: { with: /\A[a-zA-Z]+\z/, message: 'Only numbers and letters are allowed' },
                         length: { in: 2..40 }

  validates :last_name, presence: { message: 'Must be given' }, format: { with: /\A[a-zA-Z]+\z/, message: 'Only numbers and letters are allowed' },
                        length: { in: 2..40 }

  validates :email, presence: { message: 'Must be given' }, length: { in: 2..40 }
end
