class RateForm
  include ActiveModel::Model

  attr_accessor :amount

  validates :amount, presence: true, numericality: { greater_or_equal_to: 0, less_than_or_equal_to: 5 }

end
