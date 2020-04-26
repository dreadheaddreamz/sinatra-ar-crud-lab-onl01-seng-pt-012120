
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
  
  get '/articles'do
    @articles = Article.all
    erb :index
  end
  
  
  get '/articles/:id' do
    article = Article.find(params[:id])
    @article = article
    erb :show
  end
  
  get '/articles/:id/edit' do
    article = Article.find(params[:id])
    @article = article
    erb :edit
  end
  
  patch '/articles/:id' do
    @article = Article.update(title: params[:title], content: params[:content])
    erb :show
  end
  
   delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect "/articles"
  end
  
  
  
  
end
