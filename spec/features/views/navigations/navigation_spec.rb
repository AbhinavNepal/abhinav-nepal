require "feature_spec_helper"

RSpec.feature "Navigation", type: :feature, js: true do
  describe "homepage" do
    before(:each) do
      visit "/"
    end

    it "contains all top nav options" do
      within(:css, "ul.navbar-nav") do
        %w[Scholars About].each do |nav|
          expect(page).to have_text nav
        end
      end
    end
  end
end
