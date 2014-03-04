class CreateProjectSubelements < ActiveRecord::Migration
  def change
    create_table :project_subelements do |t|
      t.string :name
      t.integer :project_element_id
      t.integer :status
      t.datetime :finished

      t.timestamps
    end
  end
end
