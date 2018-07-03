class CreateTaskTags < ActiveRecord::Migration[5.1]
  def change
    create_table :task_tags do |t|
      t.belongs_to :task
      t.belongs_to :tag
      t.timestamps
    end
  end
end
