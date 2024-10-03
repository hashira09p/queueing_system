class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :ticket_number
      t.references :work_station
      t.datetime :finished_at
      t.datetime :active_at
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
