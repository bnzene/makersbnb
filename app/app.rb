ENV["RACK_ENV"] ||= "development"


require 'sinatra/base'
require_relative 'datamapper_setup.rb'
require 'sinatra/flash'

class Makersbnb < Sinatra::Base
 use Rack::MethodOverride
register Sinatra::Flash

enable :sessions
set :session_secret, 'super secret'

helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

  get '/' do

    erb :"index"
  end

  get '/users/new' do
    @user = User.new
     erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
             password: params[:password],
             password_confirmation: params[:password_confirmation])
    if @user.save
    session[:user_id] = @user.id
    redirect to('/spaces')
    else
      # flash.next[:notice] = "Password and confirmation password do not match"
      redirect ('/users/new')
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to('/spaces')
    else
    # flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to '/'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/spaces' #added this
  end

  # post '/spaces' do
  #   @space = Space.all(:date_from => params[:date_from]) + Space.all(:date_to => params[:date_to])
  #   redirect "/spaces"
  # end

  ## WERE HERE!!
  post '/spaces' do
    # @space = Space.all(:date_from => "#{df}") + Space.all(:date_to => "#{dt}")
    @space = Space.all(date_from: 'params[:date_from]') + Space.all(date_to: 'params[:date_from]')
    redirect "/spaces"
  end

  # post '/viewspace' do
  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    erb :'spaces/viewspace'
  end

  post '/booking_acknowledged' do
    # @space = Space.first(id: id)
    @user = current_user
    @booking = Booking.create(space_id: params[:space_id], name: params[:name], user_id: params[current_user.id], date_from: params[:date_from], date_to: params[:date_to], status: [nil])
    @id =  @booking.id
    erb :'/sessions/mybookings'
  end

  get '/listspace' do
    erb :'spaces/newspace'
  end

  post '/listingconfirmed' do
    @space = Space.create(user_id: params[current_user.id], name: params[:name], description: params[:description], price: params[:price], date_from: params[:date_from], date_to: params[:date_to])
    @id =  @space.id
    if @space.save
      redirect "/listingconfirmed/#{@id}"
    else
      redirect ('/listspace')
    end
  end

  get '/listingconfirmed/:id' do |id|
    @space = Space.first(id: id)
    erb :"spaces/listingconfirmed"
  end

  get '/mybookings' do
    @bookings = Booking.all
    @user = self.current_user
    p @created_bookings
    p @received_bookings
    @created_bookings = @user.created_bookings(@bookings) # not creating anything
    @received_bookings = @user.received_bookings(@bookings) # not creating anything
    erb :'/sessions/mybookings'
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
