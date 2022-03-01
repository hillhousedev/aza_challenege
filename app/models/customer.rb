class Customer < ApplicationRecord
    has_many :fx_transactions, dependent: :destroy
end
