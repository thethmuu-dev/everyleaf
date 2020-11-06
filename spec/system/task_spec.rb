require 'rails_helper'
RSpec.describe 'Task management function', type: :system do

  describe 'New creation function' do
    context 'When creating a new task' do
      before(:each) do
        visit tasks_path
        click_link 'New Task'
        within('form') do
          fill_in 'Title', with: 'Test Title'
          select '2020', from: :task_expired_at_1i
          select 'November', from: :task_expired_at_2i
          select '6', from: :task_expired_at_3i
          select 'Incompleted', from: :task_status
          select 'Medium', from: :task_priority
          click_button 'Save'
        end
      end
      it 'The created task is displayed' do
        expect(page).to have_content('Task Added')
      end
    end
  end

  describe 'List display function' do
    context 'When transitioning to the list screen' do
      # Create a task for use in testing
      task = FactoryBot.create(:task)
      it 'The created task list is displayed' do
        # Transition to task list page
        visit tasks_path
        # The Text "Task" Appears On The Visited (Transitioned) Page (Task List Page) 
        # Expect (Confirm / Expect) That Have_content Is Included (Is Included) 
        expect(page).to have_content 'task'
        # Expect the result is true If the test is successful, if false, the result is output as a failure
      end
    end

    context 'When tasks are arranged in descending order of creation date and time' do
      it 'New task is displayed at the top' do
        FactoryBot.create(:task)
        FactoryBot.create(:task2)
        visit tasks_path
        task_list = Task.all.order(created_at: :desc)
        task = task_list.first
        expect(task.title).to eq("Write Codes")
      end
    end
  end

  describe 'Detailed display function' do
    context 'When transitioned to any task details screen' do
      task = FactoryBot.create(:task, title: 'task')
      it 'The content of the relevant task is displayed' do
        visit tasks_path
        click_link '➱', match: :first
        expect(page).to have_content 'task'
      end
    end
  end
end
