json.array!(@authors) do |author|
  json.extract! author, :id, :name
  json.url author_url(author, format: :json)

  json.books author.books do |book|
    json.title book.title
  end
end
