require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader   :password
  attr_accessor :password_confirmation, :received_bookings, :created_bookings

  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, Text

  has n, :spaces
  has n, :bookings
  has n, :bookings, :through => :spaces
# has a table of spaces; that table has n bookings

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_presence_of :email
  validates_format_of :email, as: :email_address
  validates_confirmation_of :password
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      # return this user
      user
    else
      nil
    end
  end

  def self.received_bookings(bookings)
    bookings.each do |booking|
      if booking.customer_id != self.id
        return booking
      end
    end
  end

  def self.created_bookings(bookings)
    bookings.each do |booking|
      if booking.customer_id == self.id
        return booking
      end
    end
  end

end
