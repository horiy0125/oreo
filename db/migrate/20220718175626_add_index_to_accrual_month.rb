class AddIndexToAccrualMonth < ActiveRecord::Migration[6.1]
  def change
    add_index :monthly_balances, :accrual_month, unique: true
  end
end
