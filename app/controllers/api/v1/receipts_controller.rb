class Api::V1::ReceiptsController < Api::V1::BaseController
  before_action :allowed_user!
  before_action :find_receipt, only: [:update, :destroy]

  def create
    @receipt = Receipt.create!(receipt_permitted_params)

    @receipt = {
      id: @receipt.id,
      userId: @receipt.user_id,
      accrualDate: @receipt.accrual_date,
      title: @receipt.title,
      amount: @receipt.amount,
      createdAt: @receipt.created_at,
      updatedAt: @receipt.updated_at
    }

    render json: {
      receipt: @receipt
    }, status: :created, location: api_v1_receipt_path(@receipt)
  end

  def update
    @receipt.update!(receipt_permitted_params)

    render nil, status: :no_content
  end

  def destroy
    @receipt.destroy!

    render nil, status: :no_content
  end

  private

  def find_receipt
    @receipt = Receipt.find(params[:id])

    if current_user.id != @receipt.user_id
      render_403
    end
  end

  def receipt_permitted_params
    receipt_params =
      params
        .require(:receipt)
        .permit(:accrualDate, :title, :amount, :userId)

    return {
      accrual_date: receipt_params.accrualDate,
      title: receipt_params.title,
      amount: receipt_params.amount,
      user_id: receipt_params.userId
    }
  end

end
