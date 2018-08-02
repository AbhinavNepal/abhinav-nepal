require "rails_helper"

RSpec.describe ListItem, type: :model do
  describe "#to_s" do
    it "returns label" do
      item = build(:list_item, %i[for_org_positions for_publication_sources].sample)
      expect(item.to_s).to eq item.label
    end
  end
end
