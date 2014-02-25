class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :social_network
      t.string :email
      t.string :access_token

      t.timestamps
    end
  end
end
