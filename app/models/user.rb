require 'bcrypt'

class User
  include DataMapper::Resource

  has n, :bookings, through: Resource
  has n, :spaces, through: Resource
  has n, :bookings, :through => :spaces

  attr_reader   :password
  attr_accessor :password_confirmation, :received_bookings, :created_bookings

  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, Text

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

  def created_bookings
    @bookings = Booking.all
    @created_bookings = []
    @bookings.each do |booking|
      if booking.user_id == self.id
        @created_bookings << booking
      end
    end
    @created_bookings
  end

  def received_bookings
    @bookings = Booking.all
    @received_bookings = []
    @bookings.each do |booking|
      if booking.user_id != self.id
        @received_bookings << booking
      end
    end
    @received_bookings
  end
end
