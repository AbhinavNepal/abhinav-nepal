require "rails_helper"

RSpec.describe ListItem, type: :model do
  describe "#to_s" do
    it "returns label" do
      list_item = build(:player)
      expect(list_item.to_s).to eq list_item.label
    end
  end
end
