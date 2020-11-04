class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.string      :name
      t.integer     :stock
      t.integer     :book_id
      t.date        :checkout_date
      t.timestamps
    end
  end
end