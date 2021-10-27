class Conference < ApplicationRecord
  has_many :article_conference
  has_many :article, through: :article_conference
end
