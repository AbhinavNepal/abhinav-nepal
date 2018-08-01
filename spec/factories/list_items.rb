FactoryBot.define do
  factory :player, class: ListItem do
    label { Faker::Football.player }
    association :list, factory: :team
  end
end
