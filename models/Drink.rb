class Drink
    include DataMapper::Resource
    property :id, Serial
    property :name, String
    property :price, String
    property :description, Text
end

