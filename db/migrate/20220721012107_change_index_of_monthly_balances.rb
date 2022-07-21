class ChangeIndexOfMonthlyBalances < ActiveRecord::Migration[6.1]
  def change
    add_index :monthly_balances, [:user_id, :accrual_month], unique: true
    remove_index :monthly_balances, :accrual_month, unique: true
  end
end
