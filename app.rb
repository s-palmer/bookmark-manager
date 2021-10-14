require "sinatra/base"
require "sinatra/reloader"
require_relative "./lib/bookmark"

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    erb :index
  end

  post "/submit" do
    url, title = params[:url], params[:title]
    Bookmark.create(url: url, title: title)
    redirect('/bookmarks')
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :'bookmarks/bookmarks'
  end
  
  run! if app_file == $0
end
