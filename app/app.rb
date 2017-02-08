ENV["RACK_ENV"] ||= "test"


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
