class DistanceController < ApplicationController
  def create
    distance = Distance.find_or_initialize_by(distance_params)

    if distance.save
      render json: { status: :ok, message: success_message(distance) }
    else
      render json: { status: :unprocessable_entity, message: error_message(distance) }
    end
  end

  private

  def success_message(distance)
    status = distance.created_at == distance.updated_at ? 'created' : 'updated'
    I18n.t("models.distance.messages.success.#{status}")
  end

  def error_message(distance)
    errors = distance.errors.full_messages
    return errors if errors.present?
  end

  def distance_params
    request.raw_post
  end
end
