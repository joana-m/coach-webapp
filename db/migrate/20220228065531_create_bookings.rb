class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :coach_session, null: false, foreign_key: true
      t.integer :total_amount
      t.integer :date_start
      t.integer :date_end

      t.timestamps
    end
  end
end
