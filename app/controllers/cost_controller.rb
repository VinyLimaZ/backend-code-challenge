class CostController < ApplicationController
  def show
    route = Cost.new(cost_params)
    if route.valid?
      cost = CostService.call(route)
      render json: { status: :ok, cost: cost }
    else
      render json: { status: :unprocessable_entity,
                     message: route.errors.full_messages }
    end
  end

  private

  def cost_params
    params.permit(:origin, :destination, :weight)
  end
end
