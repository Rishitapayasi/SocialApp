class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.belongs_to :follower
      t.belongs_to :followed
      
      

      t.timestamps
    end
  end
end
