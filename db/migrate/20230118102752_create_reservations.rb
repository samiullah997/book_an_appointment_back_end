class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|

      t.date :date
      t.boolean :reserve

      t.timestamps
    end
  end
end
