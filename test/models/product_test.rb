require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'validates product creation' do
    product = Product.new(name: 'Rice', quantity: 2, purchase_price: 5, sale_price: 22)
    assert product.save
    product_count = Product.where(name: 'Rice')
    assert(1, product_count)
  end

  test 'Create and validate fields' do
    product = Product.new
    assert_not product.save
  end
end
