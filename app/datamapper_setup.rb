require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'


require_relative './models/user.rb'
require_relative './models/space.rb'
require_relative './models/booking.rb'

DataMapper.setup(:default, "postgres://localhost/makersbnb_#{ENV["RACK_ENV"]}")
DataMapper.finalize
DataMapper.auto_upgrade!
