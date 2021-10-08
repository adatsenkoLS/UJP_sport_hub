class User < ApplicationRecord
  # Include default devise modules. Others available are:

  # :confirmable, :rememberable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :lockable, :timeoutable, :trackable, :omniauthable

  def name
    [first_name, last_name].join(' ')
  end
end
