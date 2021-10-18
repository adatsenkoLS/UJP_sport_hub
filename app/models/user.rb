  class User < ApplicationRecord
  # Include default devise modules. Others available are:

  # :confirmable, :rememberable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :lockable, :timeoutable, :trackable, :omniauthable, password_length: 8..128

  def name
    [first_name, last_name].join(' ')
  end

  validates :first_name, presence: {message: "Must be given"}, format: {with: /\A[a-zA-Z]+\z/, message: "Only letters are allowed" }, 
    length: {in: 2..40}

  validates :last_name, presence: {message: "Must be given"}, format: {with: /\A[a-zA-Z]+\z/, message: "Only letters are allowed" }, 
    length: {in: 2..40}

  validates :email, presence: {message: "Must be given"}, length: {in: 2..40}

  validates :password, presence: true, length: {in: 8..40}
end
