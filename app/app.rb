ENV["RACK_ENV"] ||= "test"


require 'sinatra/base'
require_relative 'datamapper_setup'
require 'sinatra/flash'



class Makersbnb < Sinatra::Base

register Sinatra::Flash

enable :sessions
set :session_secret, 'super secret'

helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
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


  get '/login' do

  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces' #added this
  end

  # post '/viewspace' do
    get '/spaces/:id' do
      @space = Space.first(id: params[:id])
      erb :'viewspace'
    end
  # end

  get '/listspace' do

    erb :'newspace'
  end

  post '/listingconfirmed' do
    @space = Space.create(name: params[:name], description: params[:description], price: params[:price])
    @id =  @space.id
    redirect "/listingconfirmed/#{@id}"
  end

  get '/listingconfirmed/:id' do |id|
    @space = Space.first(id: id)
    erb :"listingconfirmed"
  end





  # start the server if ruby file executed directly
  run! if app_file == $0
end
