class Api::V1::BalanceController < Api::V1::BaseController
  before_action :allowed_user!

  def index
    user_id = current_user.id

    year = params[:year].to_i
    month = params[:month].to_i
    accrual_month = Date.new(year, month)
    previous_month = Date.new(year, month-1)

    @monthly_balances =
      MonthlyBalance
        .where(
          user_id: user_id,
          accrual_month: accrual_month.end_of_month.to_s
        )

    @monthly_balance =
      if @monthly_balances.length == 1
        @monthly_balances[0]
      else
        nil
      end

    @previous_monthly_balances =
      MonthlyBalance
        .where(
          user_id: user_id,
          accrual_month: previous_month.end_of_month.to_s
        )

    @previous_monthly_balance =
      if @previous_monthly_balances.length == 1
        @previous_monthly_balances[0]
      else
        nil
      end

    amount =
      if @monthly_balance == nil
        0
      else
        @monthly_balance.amount
      end

    previous_amount =
      if @previous_monthly_balance == nil
        0
      else
        @previous_monthly_balance.amount
      end

    changes = amount - previous_amount

    @expenses =
      Expense
        .where(
          user_id: user_id,
          accrual_date: accrual_month.beginning_of_month..accrual_month.end_of_month
        )
        .order(accrual_date: :desc)

    total_expenses =
      if @expenses.length > 0
        @expenses.sum(:amount)
      else
        0
      end

    @receipts =
      Receipt
        .where(
          user_id: user_id,
          accrual_date: accrual_month.beginning_of_month..accrual_month.end_of_month
        )
        .order(accrual_date: :desc)

    total_receipts =
      if @receipts.length > 0
        @receipts.sum(:amount)
      else
        0
      end

    render json: {
      balance: amount,
      changes: changes,
      monthlyBalance: @monthly_balance,
      expenses: @expenses,
      totalExpenses: total_expenses,
      receipts: @receipts,
      totalReceipts: total_receipts
    }
  end

end
