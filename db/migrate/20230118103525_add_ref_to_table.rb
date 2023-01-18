class AddRefToTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :user, foreign_key: true
    add_reference :reservations, :bike, foreign_key: true
    add_reference :bikes, :user, foreign_key: true
  end
end
