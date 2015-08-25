class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :name
      t.string :subtitle
      t.text :desc
      t.integer :status

      t.timestamps null: false
    end
  end
end
