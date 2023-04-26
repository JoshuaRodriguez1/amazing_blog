class ContactForm
  include ActiveModel::Model

  ATTRIBUTES = %w(email title content).freeze

  attr_accessor(*ATTRIBUTES)
  
  validates :email, format: { with: /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/ }
  validates_presence_of :email, :title, :content
  validates :title, length: { minimum: 5}
  validates :content, length: { minimum: 5}

  def attributes
    ATTRIBUTES.map {|e| [e, send(e)]}.to_h
  end
end
