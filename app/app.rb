ENV["RACK_ENV"] ||= "development"


require 'sinatra/base'
require_relative 'datamapper_setup'
require 'sinatra/flash'


class Makersbnb < Sinatra::Base

set :session_secret, 'super secret'
register Sinatra::Flash
enable :sessions

  get '/' do
    'Hello Makersbnb!'
  end

  get '/login' do

  end

  get '/spaces' do

  end

  get '/newspace' do

  end

  get '/listingconfirmed' do

  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end