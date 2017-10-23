require_relative('../db/sql_runner')

class Artist

  attr_reader :name, :id

  def initialize(options)
    @id = options['id'].to_i()
    @name = options['name']
  end









end
