class Transaction < ApplicationRecord
    validates :email, :serial_number, :approved, presence: true
end