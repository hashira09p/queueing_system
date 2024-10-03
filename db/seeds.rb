# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  Ticket.create(ticket_number: Ticket.count + 1)
end

WorkStation.create([
              { name: 'WorkStation 1', status: 1 },
              { name: 'WorkStation 2', status: 1 },
              { name: 'WorkStation 3', status: 1 },
              { name: 'WorkStation 4', status: 1 },
              { name: 'WorkStation 5', status: 1 },
              { name: 'WorkStation 6', status: 1 },
            ])