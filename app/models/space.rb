class Space
  include DataMapper::Resource

  property :id, Serial
  property :user_id, Serial
  property :name, String, required: true
  property :description, Text, required: true
  property :price, Integer, required: true
  property :date_from, Date, required: true
  property :date_to, Date, required: true

  has n, :bookings

# DataMapper::UnknownRelationshipError - No relationships
# named received_bookings or received_booking in Space

end
