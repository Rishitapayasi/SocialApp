class UserProfile < ApplicationRecord
  belongs_to :user

  validates :full_name, :bio, :birth_date,  presence: true

end
