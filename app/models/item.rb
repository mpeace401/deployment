require 'csv'

class Item < ApplicationRecord
    validates :name, :description, :serial_number, :available, presence: true
  
    def self.to_csv
      attributes = %w{id name description serial_number available} # Specify the fields you want to export
      CSV.generate(headers: true) do |csv|
        csv << attributes
  
        all.each do |item|
          csv << attributes.map{ |attr| item.send(attr) }
        end 
      end
    end
    # change to has_many_atached if you want to attach multiple images
    has_one_attached :image, :dependent => :destroy
  end
