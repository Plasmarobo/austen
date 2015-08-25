class CreateCodeTags < ActiveRecord::Migration
  def change
    create_table :code_tags do |t|
      t.string :name
      t.string :style

      t.timestamps null: false
    end
  end
end
