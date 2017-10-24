require_relative('../models/album')
require_relative('../models/artist')
require('pry')

Album.delete_all()
Artist.delete_all()

artist_1 = Artist.new({
  "name" => "Byron Gilliam"
})

artist_2 = Artist.new({
  "name" => "Gaiser"
  })

artist_3 = Artist.new({
  "name" => "Chunk"
  })


  artist_1.save
  artist_2.save
  artist_3.save


album_1 = Album.new({
  "title" => "Blacked Out Windows",
  "genre" => "Techno",
  "quantity" => 4,
  "buy_price" => 4,
  "sell_price" => 6,
  "artist_id" => artist_1.id
})

album_2 = Album.new({
  "title" => "Flashed",
  "genre" => "Minimal, Techno",
  "quantity" => 6,
  "buy_price" => 5,
  "sell_price" => 6,
  "artist_id" => artist_2.id
})

album_3 = Album.new({
  "title" => "Stepping Stones",
  "genre" => "Melodic, Techno",
  "quantity" => 10,
  "buy_price" => 3,
  "sell_price" => 5,
  "artist_id" => artist_3.id
})



album_1.save
album_2.save
album_3.save

binding.pry
nil
