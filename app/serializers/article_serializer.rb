class ArticleSerializer < ApplicationSerializer
  attributes :id, :title, :state, :content, :created_at, :updated_at

  has_many :comments
  has_one :rating
end
