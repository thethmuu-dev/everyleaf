require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end

  

  describe 'New creation function' do
    context 'When creating a new task' do
      it 'The created task is displayed' do
      end
    end
  end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
        # Create a task for use in testing
        task = FactoryBot.create(:task, title: 'task')
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
       it 'The content of the relevant task is displayed' do
       end
     end
  end
end