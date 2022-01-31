class Product < ApplicationRecord
    validates :name, :quantity, :purchase_price, :sale_price, presence: true
end
