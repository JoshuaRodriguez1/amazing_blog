class Article < ApplicationRecord
  extend Enumerize
  rating
  
  STATES = %i[draft published].freeze

  enumerize :state, in: STATES, scope: :shallow, predicates: true
  
  has_rich_text :content
  has_many :comments, dependent: :destroy

  belongs_to :user

  validates :title, presence: true
end
