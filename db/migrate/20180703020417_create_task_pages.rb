class CreateTaskPages < ActiveRecord::Migration[5.1]
  def change
    create_table :task_pages do |t|
      t.belongs_to :task
      t.belongs_to :page

      t.timestamps
    end
  end
end
