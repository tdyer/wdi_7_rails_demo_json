class Book < ActiveRecord::Base
  belongs_to :author

  # Method credit goes to: http://brainspec.com/blog/2012/09/28/lightning-json-in-rails/
  # This will return an array of hashes instead of ActiveRecord instances, 2x as fast
  def self.lightning
    connection.select_all(select([:title, :price]).arel).to_hash
  end
end
