class WorkStation < ApplicationRecord
  enum status: { online: 0, break: 1,  offline: 2}
  has_many :tickets
end
