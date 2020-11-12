require 'rails_helper'

RSpec.feature "Labels", type: :feature do
  
  context "Create new label" do
    before(:each) do
      visit root_path
      fill_in "Email", with: "thet@gmail.com"
      fill_in "Password", with: "thetthet"
      click_button "Log in"
      
      visit new_label_path
      fill_in "Name", with: "Label 1"
      click_button "Save"
    end
    it "New label is registered" do
      expect(page).to have_content("Label Added")
    end
  end

  context "Check Label Lists" do
    before(:each) do
      visit root_path
      fill_in "Email", with: "thet@gmail.com"
      fill_in "Password", with: "thetthet"
      click_button "Log in"
    end
    it "Label list page is displayed" do
      visit labels_path
      expect(page).to have_content("Labels")
    end
  end

  context "Label details page test" do
    before(:each) do
      visit root_path
      fill_in "Email", with: "thet@gmail.com"
      fill_in "Password", with: "thetthet"
      click_button "Log in"
    end
    it "Label details page displayed" do
      FactoryBot.create(:label)
      visit labels_path
      click_link "➱", match: :first
      expect(page).to have_content("Label:")
    end
  end

end
