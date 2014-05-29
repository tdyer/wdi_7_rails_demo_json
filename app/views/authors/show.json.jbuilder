json.extract! @author, :id, :name, :birthdate, :email
json.books @author.books do |book|
  json.title book.title
end
