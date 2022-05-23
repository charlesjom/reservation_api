class Reservation < ApplicationRecord
  ATTRIBUTES_EQUIVALENCE = {
    code: :reservation_code,
    number_of_guests: :guests,
    number_of_adults: :number_of_adults,
    number_of_children: :number_of_children,
    number_of_infants: :number_of_infants,
    currency: :host_currency,
    payout_price: :expected_payout_amount,
    security_price: :listing_security_price_accurate,
    total_price: :total_paid_amount_accurate   
  }

  validates_uniqueness_of :code

  belongs_to :guest
end
