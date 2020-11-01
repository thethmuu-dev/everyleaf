require 'rails_helper'
RSpec.describe 'Task management function', type: :system do

  describe 'New creation function' do
    context 'When creating a new task' do
      before(:each) do
        visit root_path
        click_link "New Task"
        within("form") do
          fill_in "Title", with: "Test Title"
          fill_in "Deadline", with: "10pm"
          select 'Incompleted', from: :task_status
          click_button "Save"
        end
      end
      it 'The created task is displayed' do
        expect(page).to have_content("Task Added")
      end
    end
  end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      # Create a task for use in testing
      task = FactoryBot.create(:task, title: 'task')
      it 'The created task list is displayed' do
        # Transition to task list page
        visit tasks_path
        # The Text "Task" Appears On The Visited (Transitioned) Page (Task List Page) 
        # Expect (Confirm / Expect) That Have_content Is Included (Is Included) 
        expect(page).to have_content 'task'
        # Expect the result is true If the test is successful, if false, the result is output as a failure
      end
    end
  end
  describe 'Detailed display function' do
     context 'When transitioned to any task details screen' do
        task = FactoryBot.create(:task, title: 'task')
       it 'The content of the relevant task is displayed' do
        visit tasks_path
        click_link "➱", match: :first
        expect(page).to have_content 'task'
       end
     end
  end
end