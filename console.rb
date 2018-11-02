require_relative( 'models/film' )
require_relative( 'models/ticket' )
require_relative( 'models/customer' )

# require( 'pry-byebug' )

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({ 'name' => 'Borna', 'funds' => 20 })
customer1.save()
customer2 = Customer.new({ 'name' => 'Aiste', 'funds' => 10 })
customer2.save()
customer3 = Customer.new({ 'name' => 'Olivia', 'funds' => 5 })
customer3.save()

 customer3.name

film1 = Film.new({ 'title' => 'Bad Boys', 'price' => 5})
film1.save()
film2 = Film.new({ 'title' => 'Godzilla', 'price' => 5})
film2.save()
film3 = Film.new({ 'title' => 'Widows', 'price' => 5})
film3.save()

 film3.title

 ticket1 = Ticket.new({ 'film_id' => film1.id, 'customer_id' => customer1.id})
 ticket1.save()
 ticket2 = Ticket.new({ 'film_id' => film2.id, 'customer_id' => customer2.id})
 ticket2.save()
 ticket3 = Ticket.new({ 'film_id' => film3.id, 'customer_id' => customer3.id})
 ticket3.save()



p film1.customers
p customer2.films

p customer1.charge
