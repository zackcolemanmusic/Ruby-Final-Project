require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_reader :title, :genre, :quantity, :artist_id, :id

  def initialize(options)
    @id = options['id'].to_i()
    @title = options['title']
    @genre = options['genre']
    @quantity = options['quantity']
    @artist_id = options['artist_id']
  end

  def save
  sql = "INSERT INTO albums (
  title,
  genre,
  quantity,
  artist_id)
  VALUES ($1, $2, $3, $4)
  RETURNING *"
  values =[@title, @genre, @quantity, @artist_id]
  album_data = SqlRunner.run(sql, values)
  @id = album_data.first()['id'].to_i()
  end

  def self.find(id)
  sql = "SELECT * FROM albums WHERE id = $1"
  values = [id]
  album = SqlRunner.run(sql, values)
  result = Album.new(album.first)
  return result
  end

  def self.all()
  sql = "SELECT * FROM albums"
  values = []
  album = SqlRunner.run( sql, values )
  result = album.map { |album| Album.new( album ) }
  return result
  end


end
