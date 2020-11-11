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
    
    context "Check detail screen" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'thet@gmail.com')
          fill_in('Password', with: 'thetthet')
        end
      end
      it "Detail screen test pass" do
        click_button "Log in"
        click_link "Profile"
        expect(page).to have_content("Your Profile")
      end
    end

    context "Check other user detail screen" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'thet@gmail.com')
          fill_in('Password', with: 'thetthet')
        end
      end
      it "Transition to task list screen" do
        click_button "Log in"
        visit tasks_path
        expect(page).to have_content("Tasks List")
      end
    end
    context "Test log out functionality" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'thet@gmail.com')
          fill_in('Password', with: 'thetthet')
          click_button "Log in"
        end
      end
      it "Log out test pass" do
        click_link "Logout"
        expect(page).to have_content("Logged Out!")
      end
    end
  end

  describe "Admin screen test" do
    context "Be able to access admin screen" do
      FactoryBot.create(:admin)
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'admin@gmail.com')
          fill_in('Password', with: 'adminadmin')
          click_button "Log in"
        end
      end
      it "Show Admin Dashboard" do
        click_link "Dashboard"
        expect(page).to have_content("Admin Dashboard")
      end
    end

    context "General user unable to access admin screen" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'thet@gmail.com')
          fill_in('Password', with: 'thetthet')
          click_button "Log in"
        end
      end
      it "Redirect to tasks path with message" do
        visit admin_users_path
        expect(page).to have_content("You do not have Admin Rights.")
      end
    end

    context "Admin users can register new users" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'admin@gmail.com')
          fill_in('Password', with: 'adminadmin')
          click_button "Log in"
        end
      end
      it "New user is created by admin" do
        click_link "Dashboard"
        within("form") do
          fill_in('Name', with: 'Test')
          fill_in('Email', with: 'testuser@test.com')
          fill_in('Password', with: 'testuser')
          fill_in('Password confirmation', with: 'testuser')
          click_button "Create User"
        end
        expect(page).to have_content("New user created")
      end
    end

    context "Admin user can access the user details screen" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'admin@gmail.com')
          fill_in('Password', with: 'adminadmin')
          click_button "Log in"
        end
      end
      it "Show user details screen" do
        user = User.find_by(email: "admin@gmail.com")
        visit admin_user_path(user.id)
        expect(page).to have_content("Showing User Details")
      end
    end

    context "Admin user can edit the user's information" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'admin@gmail.com')
          fill_in('Password', with: 'adminadmin')
          click_button "Log in"
        end
      end
      it "Edited successfully" do
        user = User.find_by(email: "thet@gmail.com")
        visit edit_admin_user_path(user.id)
        within("form") do
          fill_in('Name', with: 'Test')
          fill_in('Email', with: 'thet@gmail.com')
          fill_in('Password', with: 'testuser')
          fill_in('Password confirmation', with: 'testuser')
          click_button "Update User"
        end
        expect(page).to have_content("thet@gmail.com")
      end
    end

    context "Admin user can delete the user" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'admin@gmail.com')
          fill_in('Password', with: 'adminadmin')
          click_button "Log in"
        end
      end
      it "Deleted successfully" do
        click_link "Dashboard"
        click_link "Delete", match: :first
        expect(page).to have_content("User account deleted successfully")
      end
    end
  end

end