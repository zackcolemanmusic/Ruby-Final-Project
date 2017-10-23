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







end
