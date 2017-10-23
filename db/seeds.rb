require_relative('../models/album')
require_relative('../models/artist')

artist_1 = Artist.new({
  "name" => "Byron Gilliam"
})

artist_2 = Artist.new({
  "name" => "Gaiser"
  })

artist_3 = Artist.new({
  "name" => "Chunk"
  })


album_1 = Album.new({
  "title" => "Blacked Out Windows",
  "genre" => "Techno",
  "quantity" => 4,
  "artist_id" => 1
})

album_2 = Album.new({
  "title" => "Flashed",
  "genre" => "Minimal, Techno",
  "quantity" => 6,
  "artist_id" => 2
})

album_3 = Album.new({
  "title" => "Stepping Stones",
  "genre" => "Melodic, Techno",
  "quantity" => 10,
  "artist_id" => 3
})


artist_1.save
artist_2.save
artist_3.save

album_1.save
album_2.save
album_3.save
