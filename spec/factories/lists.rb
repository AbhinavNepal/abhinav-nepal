FactoryBot.define do
  factory :org_positions_list, class: List do
    code { "org_positions" }
  end

  factory :publication_sources_list, class: List do
    code { "publication_sources" }
  end
end
