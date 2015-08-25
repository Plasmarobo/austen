class CreateCodeTagLinks < ActiveRecord::Migration
  def change
    create_table :code_tag_links do |t|
      t.integer :code_id
      t.integer :code_tag_id

      t.timestamps null: false
    end
  end
end
