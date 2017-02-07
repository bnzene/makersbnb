ENV["RACK_ENV"] ||= "development"


require 'sinatra/base'
require_relative 'datamapper_setup'
require 'sinatra/flash'


class Makersbnb < Sinatra::Base

set :session_secret, 'super secret'

enable :sessions

  get '/' do
     erb :index
  end

  post '/user' do
    user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/spaces'
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
