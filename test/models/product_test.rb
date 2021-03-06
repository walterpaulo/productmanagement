require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'validates product creation' do
    product = Product.new(name: 'Rice', quantity: 2, purchase_price: 5, sale_price: 22)
    assert product.save
    product_count = Product.where(name: 'Rice').count
    assert_equal(1, product_count)
  end

  test 'Create and validate fields' do
    product = Product.new
    assert_not product.save
  end

  test 'update product' do
    product_update = Product.find(1)
    product_update.name = 'Oil'
    product_update.save
    assert Product.where(name: 'Oil').present?
  end

  test 'delete product' do
    product_delete = Product.find(1)
    product_delete.destroy
    assert_not Product.find_by(id: 1).present?
  end
end
