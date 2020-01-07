
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  post '/articles' do
    Article.create(title: params["title"], content: params["content"])
    redirect "/articles/#{Article.last.id}"
  end

  get '/articles/:id' do
    id = params[:id]
    @article = Article.find(id)

    erb :show
  end

  get '/articles/:id/edit' do
    id = params[:id]
    @article = Article.find(id)

    erb :edit
  end

  patch '/articles/:id' do
    id = params["id"]
    Article.find(id).update(title: params["title"], content: params["content"])

    redirect "/articles/#{id}"
  end

  delete '/articles/:id' do
    id = params[:id]
    Article.delete(id)
  end
end
