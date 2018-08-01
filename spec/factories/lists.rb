FactoryBot.define do
  factory :team, class: List do
    code { Faker::Football.team.parameterize.underscore }
  end
end
