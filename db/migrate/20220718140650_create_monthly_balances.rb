class CreateMonthlyBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :monthly_balances do |t|
      t.date :accrual_month, null: false
      t.integer :amount, null: false
      t.text :note
      t.belongs_to :user

      t.timestamps
    end
  end
end
