class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  # Roles
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :rememberable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :lockable, :timeoutable, :trackable, :omniauthable, password_length: 8..128

  def set_default_role
    self.role ||= :user
  end

  def name
    [first_name, last_name].join(' ')
  end
end
