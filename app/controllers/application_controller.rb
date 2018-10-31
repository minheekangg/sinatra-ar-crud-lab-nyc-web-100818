
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/' do

  end

#NEW
  get '/posts/new' do
    erb :new
  end
#CREATE
  post '/posts' do
    # binding.pry
    @post = Post.create(params)
    erb :show
  end

#INDEX
  get '/posts' do
    @posts = Post.all
    erb :index
  end

#SHOW
    get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

#EDIT
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    # binding.pry
    erb :edit
  end

#UPDATE
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(params[:post])
    # binding.pry
    redirect :"/posts/#{@post.id}"
  end

  #DELETE
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    # binding.pry
    Post.delete(@post)
    erb :delete
    # binding.pry
  end

end
