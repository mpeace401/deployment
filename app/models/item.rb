class Item < ApplicationRecord
    validates :name, :serial_number, presence: true
end
