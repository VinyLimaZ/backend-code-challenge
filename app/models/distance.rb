class Distance < ApplicationRecord
  before_save :verify_persistence

  attr_reader :params

  validates_presence_of :origin, :destinatarie, :distance
  validates :distance, inclusion: { in: 0..100_000,
                                    message: I18n.t('distance.errors.distance') }

  def find_or_initialize_by(params)
    find_by(params.delete("distance")) || new(params)
  end

  private

  def find(params)
    Distance.where(origin: params.first).and(destinatarie: destinatarie)
  end

  def verify_persistence
    self['distance'] = params['distance'] if self.persisted?
  end
end
