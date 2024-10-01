class Ticket < ApplicationRecord
  belongs_to :work_station, optional: true
end
