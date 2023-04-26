class Comment < ApplicationRecord
  belongs_to :article, touch: true
  belongs_to :user

  validates :content, presence: true
end
