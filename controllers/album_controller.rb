require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/album')
require_relative('./models/artist')


get '/album' do # index
  @album = Album.all()
  erb( :index )
end
