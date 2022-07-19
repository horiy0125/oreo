class Api::V1::MonthlyBalancesController < Api::V1::BaseController
  before_action :allowed_user!
  before_action :find_monthly_balance, only: [:show, :update, :delete]

  def index
    @monthly_balances = MonthlyBalance.where(user_id: current_user.id).order(accrual_month: :desc)

    @monthly_balances = @monthly_balances.map{ |monthly_balance| {
      id: monthly_balance.id,
      userId: monthly_balance.user.id,
      accrualMonth: monthly_balance.accrual_month,
      amount: monthly_balance.amount,
      note: monthly_balance.note,
      createdAt: monthly_balance.created_at,
      updatedAt: monthly_balance.updated_at
    } }

    render json: {
      monthlyBalances: @monthly_balances
    }
  end

  def show
    @monthly_balance = {
      id: @monthly_balance.id,
      userId: @monthly_balance.user.id,
      accrualMonth: @monthly_balance.accrual_month,
      amount: @monthly_balance.amount,
      note: @monthly_balance.note,
      createdAt: @monthly_balance.created_at,
      updatedAt: @monthly_balance.updated_at
    }

    render json: {
      monthlyBalances: @monthly_balances
    }
  end

  def create
    @monthly_balance = MonthlyBalance.create!(permitted_monthly_balance_params)

    @monthly_balance = {
      id: @monthly_balance.id,
      userId: @monthly_balance.user.id,
      accrualMonth: @monthly_balance.accrual_month,
      amount: @monthly_balance.amount,
      note: @monthly_balance.note,
      createdAt: @monthly_balance.created_at,
      updatedAt: @monthly_balance.updated_at
    }

    render json: {
      monthlyBalance: @monthly_balance
    }, status: :created, location: api_v1_monthly_balance_path(@monthly_balance)
  end

  private

  def find_monthly_balance
    @monthly_balance = MonthlyBalance.find(params[:id])
  end

  def permitted_monthly_balance_params
    monthly_balance_params =
      params
        .require(:monthlyBalance)
        .permit(:accrualMonth, :amount, :userId, :note)

    return {
      accrual_month: monthly_balance_params.accrualMonth,
      amount: monthly_balance_params.amount,
      user_id: monthly_balance_params.userId,
      note: monthly_balance_params.note
    }
  end

end
