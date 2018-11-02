require_relative("../db/sql_runner")

class Film

attr_reader :id
attr_accessor :title, :price

def initialize( options )
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @price = options['price'].to_i
end


def self.all()
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    result = films.map { |film| Film.new( film ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

  def save()
    sql = "INSERT INTO films
    (
      title,
      price
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run( sql, values ).first
    @id = film['id'].to_i
  end

  def update()
      sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
      values = [@title, @price, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE * FROM films where id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def customers()
      sql = "SELECT customers.*
      FROM customers
      INNER JOIN tickets
      ON tickets.customer_id = customers.id
      WHERE film_id = $1"
      values = [@id]
      customers = SqlRunner.run(sql, values)
      return  customers.map  { |customer| Customer.new(customer)}
    end

    def tickets()
      sql = "SELECT * FROM tickets where film_id = $1"
      values = [@id]
      ticket_info = SqlRunner.run(sql, values)
      return ticket_info.map{|ticket| Ticket.new(ticket)}
    end


    def self.map_items(data)
      result = data.map{|film| Film.new(film)}
      return result
    end



end
