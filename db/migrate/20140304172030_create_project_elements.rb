class CreateProjectElements < ActiveRecord::Migration
  def change
    create_table :project_elements do |t|
      t.string :name
      t.integer :project_id
      t.integer :status
      t.datetime :finished
      t.string :body

      t.timestamps
    end
  end
end
