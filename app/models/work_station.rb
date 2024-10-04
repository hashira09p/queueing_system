class WorkStation < ApplicationRecord
  enum status: { online: 0, break: 1,  offline: 2}
  has_many :tickets
  has_many :work_station_transactions
  has_many :available_transactions, through: :work_station_transactions
end
