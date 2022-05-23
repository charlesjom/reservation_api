class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :code, index: { unique: true }
      t.date :start_date
      t.date :end_date
      t.integer :nights
      t.integer :number_of_guests
      t.integer :number_of_adults
      t.integer :number_of_children
      t.integer :number_of_infants
      t.string :currency
      t.decimal :payout_price
      t.decimal :security_price
      t.decimal :total_price
      t.decimal :paid_amount
      t.string :status_type

      t.references :guest, index: true, foreign_key: true

      t.timestamps
    end
  end
end
