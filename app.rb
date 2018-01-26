ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './models/database_setup'

class BookMarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.first_or_create(url: params[:url],title:params[:title])
    Tag.multiple_tags(params[:tags], link)
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/add_link'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  post '/user/new' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.id.nil?
      flash.next[:login_error] = 'Password and confirmation password do not match'
      redirect '/signup'
    else
      session[:user_id] = user.id
      redirect '/links'
    end
  end

  get '/signup' do
    erb :'register/signup'
  end

end
