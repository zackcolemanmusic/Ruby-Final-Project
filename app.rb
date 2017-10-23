require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/album.rb')
require_relative('./models/artist.rb')


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

get '/artist/new' do
  erb(:new_artist)
end

post '/artist/new' do
  @artist = Artist.new(params)
  @artist.save
  erb(:create_artist)
end
