require 'csv'

class Item < ApplicationRecord
    validates :name, :description, :serial_number, :available, presence: true

    def self.to_csv
      attributes = %w{id name available} # Specify the fields you want to export
      CSV.generate(headers: true) do |csv|
        csv << attributes
  
        all.each do |item|
          csv << attributes.map{ |attr| item.send(attr) }
        end 
      end
    end
  end
  