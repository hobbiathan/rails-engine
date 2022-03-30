class Item < ApplicationRecord
    validates_presence_of :name,
                          :description,
                          :unit_price,
                          :merchant_id
  
    has_many :invoice_items
    has_many :invoices, through: :invoice_items
    
    belongs_to :merchant
    has_many :bulk_discounts, through: :merchant
  
  
    enum status: [:disabled, :enabled]
  
  end