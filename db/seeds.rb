# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

WorkStation.create([
              { name: 'WorkStation 1', status: :online },
              { name: 'WorkStation 2', status: :online },
              { name: 'WorkStation 3', status: :break },
              { name: 'WorkStation 4', status: :offline },
              { name: 'WorkStation 5', status: :offline },
              { name: 'WorkStation 6', status: :break },
            ])

available_transactions = ['deposit', 'withdraw', 'balance inquiry', 'transfer', 'international transfer', 'accounts', 'others']
available_transactions.each do |available_transaction|
  AvailableTransaction.find_or_create_by(name: available_transaction)
end

10.times do
  Ticket.create(ticket_number: Ticket.count + 1, available_transaction: AvailableTransaction.all.sample)
end