require "rails_helper"

RSpec.describe Scholar, type: :model do
  describe "#name" do
    it "returns full name" do
      scholar = build(:scholar, first_name: "Foo")
      expect(scholar.name).to eq "Foo #{scholar.last_name}"
    end
  end
end
