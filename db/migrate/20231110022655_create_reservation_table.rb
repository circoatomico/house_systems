class CreateReservationTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :immobile, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
