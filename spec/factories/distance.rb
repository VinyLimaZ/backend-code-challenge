FactoryBot.define do
  factory :distance do
    # Pega uma letra aleatoria entre as do range
    origin { ('A'..'J').to_a.sample }
    destination { ('K'..'Z').to_a.sample }
    gap { rand(1..100) }
  end
end
