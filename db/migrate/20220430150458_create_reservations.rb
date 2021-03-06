class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :costume, null: false, foreign_key: true
      t.string :status
      t.date :start_date
      t.date :end_date
      t.text :message

      t.timestamps
    end
  end
end
