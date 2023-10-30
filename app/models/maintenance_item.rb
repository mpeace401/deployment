class MaintenanceItem < ApplicationRecord
    validates :item_name, :description, :total_amount, :available_amount, presence: true
end
