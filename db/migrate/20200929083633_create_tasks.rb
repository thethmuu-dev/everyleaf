class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :details
      t.date :expired_at, null: false
      t.string :status, null: false
      t.string :priority, null: false

      t.timestamps
    end
  end
end
