require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/album_controller.rb')
require_relative('./controllers/artist_controller.rb')


get '/' do
  @album = Album.all()
  @artist = Artist.all()
  erb (:index)
end

get '/artist' do # index
  @artist = Artist.all()
  erb( :artist_index )
end

get '/album' do # index
  @album = Album.all()
  erb( :album_index )
end
