FactoryBot.define do
  factory :distance do
    # Pega uma letra aleatoria entre as do range
    origin { ('A'..'J').to_a.sample }
    destinatarie { ('K'..'Z').to_a.sample }
    distance { rand(0..100) }
  end
end
