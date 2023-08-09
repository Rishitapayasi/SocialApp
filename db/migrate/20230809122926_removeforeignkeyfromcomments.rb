class Removeforeignkeyfromcomments < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :comments, :comments, column: :user_id
    add_foreign_key :comments, :users, column: :user_id
  end
end
