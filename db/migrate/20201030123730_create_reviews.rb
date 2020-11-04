class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer    :book_id
      t.text       :text
      t.integer    :rate
      t.string     :name
      t.string     :title
      t.timestamps
    end
  end
end