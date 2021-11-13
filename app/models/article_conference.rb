class ArticleConference < ApplicationRecord
  belongs_to :article
  belongs_to :conference
end
