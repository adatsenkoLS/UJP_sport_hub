class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :article_conference
  has_many :conference, through: :article_conference
end
