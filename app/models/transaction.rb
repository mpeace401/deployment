class Transaction < ApplicationRecord
    belongs_to :user
    validates :email, :serial_number, presence: true
end