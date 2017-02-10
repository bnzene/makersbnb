class Space
  include DataMapper::Resource

  has n, :bookings, through: Resource

  property :id, Serial
  property :user_id, Integer
  property :name, String, required: true
  property :description, Text, required: true
  property :price, Integer, required: true
  property :date_from, Date, required: true
  property :date_to, Date, required: true


# DataMapper::UnknownRelationshipError - No relationships
# named received_bookings or received_booking in Space

end
