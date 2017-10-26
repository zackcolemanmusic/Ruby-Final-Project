require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_reader :title, :genre, :quantity, :buy_price, :sell_price, :artist_id, :id

  def initialize(options)
    @id = options['id'].to_i()
    @title = options['title']
    @genre = options['genre']
    @quantity = options['quantity'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
    @artist_id = options['artist_id']
  end

  def save
  sql = "INSERT INTO albums (
  title,
  genre,
  quantity,
  buy_price,
  sell_price,
  artist_id)
  VALUES ($1, $2, $3, $4, $5, $6)
  RETURNING *"
  values =[@title, @genre, @quantity, @buy_price, @sell_price, @artist_id]
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

  def stock_checker
    if @quantity.between?(1,4)
      return "LOW"
    elsif @quantity.between?(5,7)
      return "MEDIUM"
    elsif @quantity >= 8
      return "HIGH"
    end
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
  sql = "UPDATE albums
  SET
  (
    title,
    genre,
    quantity,
    buy_price,
    sell_price,
    artist_id
  ) =
  (
    $1, $2, $3, $4, $5, $6
  )
  WHERE id = $7"
  values = [@title, @genre, @quantity, @buy_price, @sell_price, @artist_id, @id]
  SqlRunner.run( sql, values )
  end

  def delete()
  sql = "DELETE FROM albums
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )
  end

end
