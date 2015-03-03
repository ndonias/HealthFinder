class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :username
      t.text :body

      t.timestamps
    end
  end
end
