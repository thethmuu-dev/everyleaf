require 'rails_helper'

RSpec.describe "Tasks", type: :model do
  describe 'Validation test' do
    context 'If the task title is empty' do
      it 'Task creation fail will occur' do
        task = Task.new(title: '', status: 'Incompleted', deadline: '10pm')
        expect(task).not_to be_valid
      end
    end
    context 'If the task status is empty' do
      it 'Task creation fail will occur' do
        task = Task.new(title: 'Spec test', status: '', deadline: '10pm')
        expect(task).not_to be_valid
      end
    end
    context 'If the task deadline is empty' do
      it 'Task creation fail will occur' do
        task = Task.new(title: 'Spec test', status: 'Incompleted', deadline: '')
        expect(task).not_to be_valid
      end
    end
    context 'If all necessary field provided' do
      it 'Validation passes' do
        task = Task.new(title: 'Pass', status: 'Incompleted', deadline: '10pm')
        expect(task).to be_valid
      end
    end
  end
end