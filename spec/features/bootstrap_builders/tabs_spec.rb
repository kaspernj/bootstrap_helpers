require "rails_helper"

describe BootstrapBuilders::Tabs do
  it "renders tabs" do
    visit normal_tabs_bootstrap_builders_tabs_path

    expect(page).to have_http_status(:success)
    expect(current_path).to eq normal_tabs_bootstrap_builders_tabs_path
  end

  describe "pills" do
    it "sets the correct classes with help from argument parser" do
      visit pills_bootstrap_builders_tabs_path

      nav = find(".bb-tabs-container > .nav")

      expect(nav[:class]).to eq "nav nav-pills"
    end
  end
end
