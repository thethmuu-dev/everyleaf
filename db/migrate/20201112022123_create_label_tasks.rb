class CreateLabelTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :label_tasks do |t|
      t.integer :label_id
      t.integer :task_id
    end
  end
end
