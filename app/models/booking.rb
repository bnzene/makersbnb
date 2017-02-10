
class Booking
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :date_from, Date, required: true
  property :date_to, Date, required: true
  property :user_id, Serial, required: true
  property :space_id, Serial, required: true
  property :status, Boolean

  # def created_bookings
  #   CreatedBooking if customer_id == current_user.id
  # self.CreatedBooking
  # end
  #
  # def received_bookings
  #   ReceivedBooking if customer_id != current_user.id
  # end

end
