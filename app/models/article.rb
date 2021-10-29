class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :article_conference
  has_many :conference, through: :article_conference
  validates_uniqueness_of :headline, :caption
end
