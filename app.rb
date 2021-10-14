# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  post '/submit' do
    url = params[:url]
    title = params[:title]
    Bookmark.create(url: url, title: title)
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
    @bookmark_id = params[:id]
    erb :'/bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec_params(
      "UPDATE bookmarks SET url = $1, title = $2 WHERE id = $3", [ params[:url], params[:title], params[:id]]
    )
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
