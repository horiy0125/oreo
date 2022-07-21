class MonthlyBalance < ApplicationRecord
  belongs_to :user

  validates :accrual_month, uniqueness: { scope: :user_id }
  validates :amount, presence: true
end
