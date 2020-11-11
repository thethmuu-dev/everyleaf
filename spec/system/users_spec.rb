require 'rails_helper'

RSpec.feature "Users", type: :feature do

  describe "User registration test" do
    context "Register new user" do
      before(:each) do
        visit root_path
        click_link "Sign up"
        within("form") do
          fill_in('Name', with: 'Aung')
          fill_in('Email', with: 'aung@gmail.com')
          fill_in('Password', with: 'aungaung')
          fill_in('Password confirmation', with: 'aungaung')
        end
      end
      it "New user is registered" do
        click_button "Create Account"
        expect(page).to have_content("you have successfully signed up")
      end
    end
    context "Check task list without login" do
      before(:each) do
        visit tasks_path
      end
      it "Redirect to login with message" do
        expect(page).to have_content("You Need to Log In or Sign Up before Continuing")
      end
    end
  end

  describe "Testing session functionality" do
    context "Be able to login" do
      # FactoryBot.create(:user)
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'thet@gmail.com')
          fill_in('Password', with: 'thetthet')
        end
      end
      it "Login test pass" do
        click_button "Log in"
        expect(page).to have_content("Logged In.")
      end
    end
    # context "Check detail screen" do
    #   before(:each) do
    #     visit root_path
    #     within("form") do
    #       fill_in('Email', with: 'thet@gmail.com')
    #       fill_in('Password', with: 'thetthet')
    #     end
    #   end
    #   it "Detail screen test pass" do
    #     click_button "Log In"
    #     click_link "My Profile"
    #     expect(page).to have_content("Showing User Details")
    #   end
    # end
    # context "Check other user detail screen" do
    #   before(:each) do
    #     visit root_path
    #     within("form") do
    #       fill_in('Email', with: 'test')
    #       fill_in('Password', with: 'hellotest')
    #     end
    #   end
    #   it "Transition to task list screen" do
    #     click_button "Log In"
    #     user = User.find_by(Email: "admin")
    #     visit user_path(user.id)
    #     expect(page).to have_content("Task List")
    #   end
    # end
    # context "Test log out functionality" do
    #   before(:each) do
    #     visit root_path
    #     within("form") do
    #       fill_in('Email', with: 'thet@gmail.com')
    #       fill_in('Password', with: 'thetthet')
    #       click_button "Log In"
    #     end
    #   end
    #   it "Log out test pass" do
    #     click_link "LogOut"
    #     expect(page).to have_content("Logged out")
    #   end
    # end
  end

end