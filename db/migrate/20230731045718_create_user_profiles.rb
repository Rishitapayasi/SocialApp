class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :full_name
      t.string :bio
      t.date :birth_date
      t.references :user,  foreign_key: true

      t.timestamps
    end
  end
end
