class CreateBlogposts < ActiveRecord::Migration
  def change
    create_table :blogposts do |t|
      t.string :name
      t.text :body
      t.date :create

      t.timestamps
    end
  end
end
