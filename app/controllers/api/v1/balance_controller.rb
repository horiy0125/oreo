class Api::V1::BalanceController < Api::V1::BaseController
  before_action :allowed_user!

  def index
    user_id = current_user.id

    @monthly_balances =
      MonthlyBalance
        .where(user_id: user_id)
        .order(accrual_month: :desc)

    @expenses =
      Expense
        .where(user_id: user_id)
        .order(accrual_date: :desc)

    @receipts =
      Receipt
        .where(user_id: user_id)
        .order(accrual_date: :desc)

    render json: {
      monthly_balances: @monthly_balances,
      expenses: @expenses,
      receipts: @receipts
    }
  end

end
