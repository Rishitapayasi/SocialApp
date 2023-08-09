class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :comment
     
      t.references :post,  foreign_key: true
      t.references :user, foreign_key: { to_table: :comments }
      t.timestamps
    end
  end
end
