class InvoiceItem < ApplicationRecord
    validates_presence_of :invoice_id,
                          :item_id,
                          :quantity,
                          :unit_price,
                          :status
  
    belongs_to :invoice
    belongs_to :item
    has_many :bulk_discounts, through: :item
  
  
    enum status: [:pending, :packaged, :shipped]
 
  end