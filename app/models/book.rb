class Book < ActiveRecord::Base
  belongs_to :author

  # Method credit goes to: http://brainspec.com/blog/2012/09/28/lightning-json-in-rails/
  # This will return an array of hashes instead of ActiveRecord instances, 2x as fast
  def self.lightning
    connection.select_all(select([:title, :price]).arel).each do |attrs|
      attrs.each_key do |attr|
        attrs[attr] = type_cast_attribute(attr, attrs)
      end
    end
  end
end
