class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :ticket_number
      t.references :work_station
      t.timestamps
    end
  end
end
