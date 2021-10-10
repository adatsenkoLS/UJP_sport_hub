  class User < ApplicationRecord
  # Include default devise modules. Others available are:

  # :confirmable, :rememberable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :lockable, :timeoutable, :trackable, :omniauthable, password_length: 8..128

  def name
    [first_name, last_name].join(' ')
  end

  validates :first_name, :last_name, :email, presence: true

  validates :encrypted_password, :confirmation => true,
                       :length => {:within => 6..40},
                       :allow_blank => true,
                       :on => :change
end
