require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/album.rb')
require_relative('./models/artist.rb')


get '/home' do
  @album = Album.all()
  @artist = Artist.all()
  erb (:index)
end

get '/artist' do
  @artists = Artist.all()
  erb( :artist_index )
end

get '/artist/new' do
  erb(:new_artist)
end

post '/artist/new' do
  @artist = Artist.new(params)
  @artist.save
  redirect to ('/artist')
end
#--------------------------------#
get '/album' do
  @album = Album.all()
  erb( :album_index )
end

get '/album/new' do
  @artists = Artist.all()
  erb(:new_album)
end

post '/album/new' do
  @album = Album.new(params)
  @album.save
  redirect to ('/home')
end

#------------------------#

get '/album/:id/edit' do
  @album = Album.find( params[:id] )
  @artists = Artist.all()
  erb( :edit_album )
end

post '/album/:id' do
  Album.new( params ).update
  redirect to '/home'
end

post '/album/:id/delete' do
  album = Album.find( params[:id] )
  album.delete()
  redirect to '/home'
end
