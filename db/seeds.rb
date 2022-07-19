# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if Rails.env.development? || Rails.env.test?

  admin_user = User.create(
    email: "k.horiy0125@gmail.com",
    password: "NbW@.@9att2_xh77Jf_@n3bLc9A-6b*thhm-abCK6N!*kR!kL3_z2sh4b8ZQ2!Hk_zucdvktw!im3A-*_F-VfgiwM@AobYe9ZXgd"
  )

  example_user = User.create(
    email: "example@example.com",
    password: "wWKizGL.yv6c9zHxfh_7KXyB-WkxTUj47i-qZp_DL9gH_zEPkBiVMJsvujaYFUVkEnf!TE2u4qirEK2AFQ-qmi43_UpUkaMQjhKo"
  )

  monthly_balances = MonthlyBalance.create([
    {
      accrual_month: 1.months.ago.end_of_month,
      amount: 60000,
      user_id: admin_user.id
    },
    {
      accrual_month: 2.months.ago.end_of_month,
      amount: 50000,
      user_id: admin_user.id
    },
    {
      accrual_month: 3.months.ago.end_of_month,
      amount: 40000,
      user_id: admin_user.id
    }
  ])

  reciepts = Receipt.create([
    {
      accrual_date: 1.months.ago,
      title: "給与",
      amount: 100000,
      user_id: admin_user.id
    },
    {
      accrual_date: 2.months.ago,
      title: "給与",
      amount: 90000,
      user_id: admin_user.id
    },
    {
      accrual_date: 3.months.ago,
      title: "給与",
      amount: 80000,
      user_id: admin_user.id
    }
  ])

  expenses = Expense.create([
    {
      accrual_date: 1.months.ago,
      title: "雑損",
      amount: 40000,
      user_id: admin_user.id
    },
    {
      accrual_date: 2.months.ago,
      title: "雑損",
      amount: 40000,
      user_id: admin_user.id
    },
    {
      accrual_date: 3.months.ago,
      title: "雑損",
      amount: 40000,
      user_id: admin_user.id
    }
  ])

end
