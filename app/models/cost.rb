class Cost
  include ActiveModel::Validations
  include ActiveModel::Translation

  attr_accessor :origin, :destination, :weight

  validate :has_record
  validates_presence_of :origin, :destination, :weight
  validates_inclusion_of :weight, in: (0..50),
                                  message: I18n.t('models.cost.errors.validation.inclusion.weight')

  def initialize(params)
    @origin = params[:origin]
    @destination = params[:destination]
    @weight = params[:weight].to_i
  end

  private

  def has_record
    route_origin = Distance.where(origin: [origin, destination])
    route_destination = Distance.where(destination: [origin, destination])

    if route_origin.blank? || route_destination.blank?
      errors.add(:base, I18n.t('models.cost.errors.validation.inexistent_distance'))
    end
  end
end
