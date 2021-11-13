class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :article_conference
  has_many :conference, through: :article_conference
  validates_uniqueness_of :headline, :caption

  validate :image_presence

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
