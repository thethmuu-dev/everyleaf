require 'rails_helper'

RSpec.describe "Tasks", type: :model do
  describe 'Validation test' do
    context 'If the task title is empty' do
      it 'Task creation fail will occur' do
        task = Task.new(title: '', status: 'Incompleted', expired_at: '2020-11-06 20:08:00 +0630')
        expect(task).not_to be_valid
      end
    end
    context 'If the task status is empty' do
      it 'Task creation fail will occur' do
        task = Task.new(title: 'Spec test', status: '', expired_at: '2020-11-06 20:08:00 +0630')
        expect(task).not_to be_valid
      end
    end
    context 'If the task expired_at is empty' do
      it 'Task creation fail will occur' do
        task = Task.new(title: 'Spec test', status: 'Incompleted', expired_at: '')
        expect(task).not_to be_valid
      end
    end
    context 'If all necessary field provided' do
      it 'Validation passes' do
        task = Task.new(title: 'Pass', status: 'Incompleted', priority: 'Medium', expired_at: '2020-11-06 20:08:00 +0630')
        expect(task).to be_valid
      end
    end
  end
end