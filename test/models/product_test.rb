require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "validates product creation" do
    product = Product.new(name: "Rice", quantity: 2, purchase_price: 5, sale_price: 10)
    assert product.save
  end

  test "Create and validate fields" do
    product = Product.new
    assert_not product.save
  end

end
