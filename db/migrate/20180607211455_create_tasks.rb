class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :github_branch
      t.boolean :priority
      t.string :status_summary

      t.timestamps
    end
  end
end
