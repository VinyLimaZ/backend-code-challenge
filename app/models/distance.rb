# Class to register locations and their gap
class Distance < ApplicationRecord
  before_validation :update_gap

  validates_presence_of :origin, :destination, :gap
  validates_inclusion_of :origin, :destination,
                         in: ('A'..'Z'),
                         message: I18n.t('models.distance.attributes.errors.inclusion.routes')
  validates_length_of :origin, :destination, is: 1
  validates_inclusion_of :gap,
                         in: 0..100_000,
                         message: I18n.t('models.distance.attributes.errors.inclusion.gap')

  def self.find_or_initialize_by(params)
    @@distance_attr = DistanceSanitizeService.call(params)
    origin = @@distance_attr['origin']
    destination = @@distance_attr['destination']

    find_by(origin: origin, destination: destination) || new(@@distance_attr)
  end

  private

  def update_gap
    self.gap = @@distance_attr['gap'] if persisted?
  end
end
