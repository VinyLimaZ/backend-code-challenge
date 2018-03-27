require 'dijkstra'

class CostService
  attr_reader :origin, :destination, :weight
  SHIPPING_TAX = 0.15

  def self.call(route)
    new(route).call
  end

  def call
    less_cost_to_ship
  end

  private

  def initialize(route)
    @origin = route.origin
    @destination = route.destination
    @weight = route.weight
  end

  def less_cost_to_ship
    best_route = dijkstra_path(origin, destination, all_routes)
    distance_path = best_route.cost
    cost(distance_path)
  end

  def dijkstra_path(origin, destination, all_routes)
    Dijkstra.new(origin, destination, all_routes)
  end

  def all_routes
    routes = Distance.all
    path_one = routes.map do |distance|
      [distance.origin, distance.destination, distance.gap]
    end
    path_two = routes.map do |distance|
      [distance.destination, distance.origin, distance.gap]
    end
    path_one + path_two
  end

  def cost(distance_path)
    distance_path * weight * SHIPPING_TAX
  end
end
