# Class to register locations and their gap
class Distance < ApplicationRecord
  validates_presence_of :origin, :destination, :gap
  validates_inclusion_of :origin, :destination,
                         in: ('A'..'Z'),
                         message: I18n.t('models.distance.errors.validation.inclusion.routes')
  validates_length_of :origin, :destination, is: 1
  validates_inclusion_of :gap,
                         in: 0..100_000,
                         message: I18n.t('models.distance.errors.validation.inclusion.gap')

  def self.find_or_initialize_by(attrs)
    origin = attrs['origin']
    destination = attrs['destination']
    gap = attrs['gap']
    distance_record = find_by(origin: origin, destination: destination)

    if distance_record.present?
      return distance_record.tap { |distance| distance.gap = gap }
    end
    new(attrs)
  end
end
