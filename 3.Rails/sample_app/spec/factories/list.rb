FactoryBot.difine do
  factory :list do
    title {Faker::Lorem.characters(number:10) }
    bosy {Faker::Lorem.characters(number:30) }
  end
end