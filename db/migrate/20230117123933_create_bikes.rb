class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :bike_image
      t.string :bike_type
      t.string :description
      t.string :brand
      t.string :daily_rate

      t.timestamps
    end
  end
end
