# Service to sanitize and organize the params received from request
# The service do: Put all location letters in UPCASE
# split the string e.g. ('x y 0') to create an array ['z', 'a', '0']
# sort the ary to ['a', 'z', '0']
# after that, put the params with the keys to form a Hash
class DistanceSanitizeService
  attr_reader :params

  def self.call(params)
    new(params).call
  end

  def call
    sanitize(params)
  end

  private

  def initialize(params)
    @params = params
  end

  def sanitize(params)
    params_sanitized = ActiveSupport::HashWithIndifferentAccess.new
    # after sort call array organization will be: [:gap, :origin, :destination]
    params = params.upcase.split.sort

    keys.each_with_index do |key, index|
      params_sanitized[key] = params[index]
    end

    params_sanitized
  end

  def keys
    %i[gap origin destination]
  end
end
