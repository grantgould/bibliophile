json.extract! book, :id, :title, :synopsis, :created_at, :updated_at
json.url book_url(book, format: :json)
