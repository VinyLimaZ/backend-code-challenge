# populate with all possible routes
destinations = ('B'..'Z').to_a
('A'..'Y').each do |origin|
  destinations.each do |destination|
    Distance.find_or_initialize_by(
      origin: origin,
      destination: destination,
      gap: rand(0..100_000)
    ).save
  end
  destinations.shift
end
