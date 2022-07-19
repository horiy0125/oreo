# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if Rails.env.development? || Rails.env.test?
  now = Time.current

  monthly_balances = MonthlyBalance.create([
    {
      accrual_month: 1.months.ago.end_of_month,
      amount: 60000,
      user_id: 1
    },
    {
      accrual_month: 2.months.ago.end_of_month,
      amount: 50000,
      user_id: 1
    },
    {
      accrual_month: 3.months.ago.end_of_month,
      amount: 40000,
      user_id: 1
    }
  ])
end
