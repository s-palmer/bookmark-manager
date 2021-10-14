# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'uri'
require './lib/bookmark'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  post '/submit' do
    # url = params[:url]
    # title = params[:title]
    # Bookmark.create(url: url, title: title)

    if params[:url] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.create(url: params[:url], title: params[:title])
    else
      flash[:notice] = "You must submit a valid URL."
    end

    redirect('/bookmarks')
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'/bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
