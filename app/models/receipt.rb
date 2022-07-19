class Receipt < ApplicationRecord
  validates :accrual_date, presence: true
  validates :title, presence: true
  validates :amount, presence: true
end
