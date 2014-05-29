json.array!(@authors) do |author|
  json.extract! author, :id, :name, :birthdate, :email
  json.url author_url(author, format: :json)
end
