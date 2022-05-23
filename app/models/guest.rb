class Guest < ApplicationRecord
  ATTRIBUTES_EQUIVALENCE = {
    email: :guest_email,
    first_name: :guest_first_name,
    last_name: :guest_last_name,
    phone_number: :guest_phone_number
  }
  
  validates_uniqueness_of :email

  has_many :reservations
end
