class User < ApplicationRecord
  # Include default devise modules. Others available are:

  # :confirmable, :rememberable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :lockable, :timeoutable, :trackable, :omniauthable, password_length: 8..128

  def name
    [first_name, last_name].join(' ')
  end
end
