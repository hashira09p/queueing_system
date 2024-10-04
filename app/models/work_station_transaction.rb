class WorkStationTransaction < ApplicationRecord
  belongs_to :work_station
  belongs_to :available_transaction
end