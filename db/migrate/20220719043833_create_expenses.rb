class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.date :accrual_date, null: false
      t.string :title, null: false
      t.integer :amount, null: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
