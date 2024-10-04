class CreateAvailableTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :available_transactions do |t|
      t.string :name
      t.timestamps
    end

    add_column :tickets, :available_transaction_id, :integer, null: false
    add_column :tickets, :other, :string

    create_table :work_station_transactions do |t|
      t.references :work_station, :available_transaction
    end
  end
end
