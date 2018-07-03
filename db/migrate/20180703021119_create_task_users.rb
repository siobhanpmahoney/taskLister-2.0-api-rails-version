class CreateTaskUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :task_users do |t|
      t.belongs_to :task
      t.belongs_to :user
      t.timestamps
    end
  end
end
