class Api::V1::MonthlyBalancesController < Api::V1::BaseController
  before_action :allowed_user!
  before_action :find_monthly_balance, only: [:update, :delete]

  def create
    @monthly_balance = MonthlyBalance.create!(monthly_balance_permitted_params)

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
      data: {
        monthlyBalance: @monthly_balance
      }
    }, status: :created, location: api_v1_monthly_balance_path(@monthly_balance)
  end

  def update
    @monthly_balance.update!(monthly_balance_permitted_params)

    render nil, status: :no_content
  end

  def destroy
    @monthly_balance.destroy!

    render nil, status: :no_content
  end

  private

  def find_monthly_balance
    @monthly_balance = MonthlyBalance.find(params[:id])

    if current_user.id != @monthly_balance.user_id
      render_403
    end
  end

  def monthly_balance_permitted_params
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
