class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :started
      t.datetime :finished
      t.string :desc
      t.string :image

      t.timestamps
    end
  end
end
