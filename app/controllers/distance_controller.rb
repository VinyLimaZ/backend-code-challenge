class DistanceController < ApplicationController
  def create
    distance = Distance.find_or_initialize(distance_params)

    respond_to do |format|
      if distance.save
        format.json { render json: { status: 200, message: message.to_s } }
      else
        format.json { render json: { status: 500, message: distance.errors.full_messages.to_s } }
      end
    end
  end

  private

  def message
    errors = distance.errors.full_messages
    return errors if errors.present?
    "Distancia #{distance.status} com sucesso!"
  end

  def distance_params
    params.require(:distance).permit(:origin, :destinatarie, :distance)
  end
end
