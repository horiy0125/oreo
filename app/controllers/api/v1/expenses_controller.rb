class Api::V1::ExpensesController < Api::V1::BaseController
  before_action :allowed_user!
  before_action :find_expense, only: [:update, :destroy]

  def create
    @expense = Expense.create!(expense_permitted_params)

    @expense = {
      id: @expense.id,
      userId: @expense.user_id,
      accrualDate: @expense.accrual_date,
      title: @expense.title,
      amount: @expense.amount,
      createdAt: @expense.created_at,
      updatedAt: @expense.updated_at
    }

    render json: {
      expense: @expense
    }, status: :created, location: api_v1_expense_path(@expense)
  end

  def update
    @expense.update!(expense_permitted_params)

    render nil, status: :no_content
  end

  def destroy
    @expense.destroy!

    render nil, status: :no_content
  end

  private

  def find_expense
    @expense = Expense.find(params[:id])

    if current_user.id != @expense.user_id
      render_403
    end
  end

  def expense_permitted_params
    expense_params =
      params
        .require(:expense)
        .permit(:accrualDate, :title, :amount, :userId)

    return {
      accrual_date: expense_params.accrualDate,
      title: expense_params.title,
      amount: expense_params.amount,
      user_id: expense_params.userId
    }
  end

end
