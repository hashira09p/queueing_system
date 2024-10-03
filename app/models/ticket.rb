class Ticket < ApplicationRecord
  belongs_to :work_station, optional: true

  enum status: { pending: 0, active: 1, finished: 2  }
end