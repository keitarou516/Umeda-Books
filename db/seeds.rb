require "csv"

CSV.foreach('db/books.csv', headers: true) do |row|
  Book.create(
    name: row['name'],
    image: row['image'],
    author: row['author']
  )
end