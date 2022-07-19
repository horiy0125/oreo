class MonthlyBalance < ApplicationRecord
  belongs_to :user

  validates :accrual_month, presence: true, uniqueness: true
  validates :amount, presence: true
end
