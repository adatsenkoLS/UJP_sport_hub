class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
<<<<<<< HEAD
  has_many :comments
=======
  has_many :article_conference
  has_many :conference, through: :article_conference
>>>>>>> origin/manage_articles
end
