
class Booking
  include DataMapper::Resource

  property :id, Serial
  property :date_from, Date, required: true
  property :date_to, Date, required: true
  property :customer_id, Serial, required: true
  property :space_id, Serial, required: true
  

end
