# Class to register locations and their gap
class Distance < ApplicationRecord
  before_save :update_gap

  validates_presence_of :origin, :destination, :gap
  validates_inclusion_of :origin, :destination, in: ('A'..'Z'), message: ''
  validates_length_of :origin, :destination, maximum: 1
  validates :gap, inclusion: { in: 0..100_000,
                               message: I18n.t('distance.errors.gap') }

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
