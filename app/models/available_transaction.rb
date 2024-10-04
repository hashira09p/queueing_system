class AvailableTransaction < ApplicationRecord
  has_many :tickets, dependent: :destroy
  has_many :work_station_transactions, dependent: :destroy
  has_many :work_stations, through: :work_station_transactions
end