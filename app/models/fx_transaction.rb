class FxTransaction < ApplicationRecord
  
  validates :identifier, :input_amount, :output_amount, :input_currency, :output_currency, :customer_id, :date_of_transaction, presence: true 
  validates :input_amount, :output_amount, numericality: {greater_than_or_equal_to: 0}, presence: true
  validates :identifier, uniqueness: true
  belongs_to :customer
end
