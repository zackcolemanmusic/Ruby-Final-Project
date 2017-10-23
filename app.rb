require_relative('./controllers/album_controller.rb')
require_relative('./controllers/artist_controller.rb')
require('sinatra')
require('sinatra/contrib/all')


get '/' do
  @albums = Album.all()
  @artists = Artist.all()
  erb :index
end
