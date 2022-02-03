require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @user = users(:one)
  end

  test "should get index" do
    cookies_admin = { "HTTP_COOKIE" => "legal_accepted=yes; product_admin={\"id\":#{@user.id},\"name\":\"#{@user.name}\",\"email\":\"#{@user.email}\"};" }
    get products_url, headers: cookies_admin
    assert_response :success
  end

  test "should get new" do
    cookies_admin = { "HTTP_COOKIE" => "legal_accepted=yes; product_admin={\"id\":#{@user.id},\"name\":\"#{@user.name}\",\"email\":\"#{@user.email}\"};" }
    get new_product_url, headers: cookies_admin
    assert_response :success
  end

  test "should create product" do
    cookies_admin = { "HTTP_COOKIE" => "legal_accepted=yes; product_admin={\"id\":#{@user.id},\"name\":\"#{@user.name}\",\"email\":\"#{@user.email}\"};" }
    assert_difference('Product.count') do
      post products_url, headers: cookies_admin, params: { product: { name: @product.name, purchase_price: @product.purchase_price, quantity: @product.quantity, sale_price: @product.sale_price } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    cookies_admin = { "HTTP_COOKIE" => "legal_accepted=yes; product_admin={\"id\":#{@user.id},\"name\":\"#{@user.name}\",\"email\":\"#{@user.email}\"};" }
    get product_url(@product), headers: cookies_admin
    assert_response :success
  end

  test "should get edit" do
    cookies_admin = { "HTTP_COOKIE" => "legal_accepted=yes; product_admin={\"id\":#{@user.id},\"name\":\"#{@user.name}\",\"email\":\"#{@user.email}\"};" }
    get edit_product_url(@product), headers: cookies_admin
    assert_response :success
  end

  test "should update product" do
    cookies_admin = { "HTTP_COOKIE" => "legal_accepted=yes; product_admin={\"id\":#{@user.id},\"name\":\"#{@user.name}\",\"email\":\"#{@user.email}\"};" }
    patch product_url(@product), headers: cookies_admin, params: { product: { name: @product.name, purchase_price: @product.purchase_price, quantity: @product.quantity, sale_price: @product.sale_price } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    cookies_admin = { "HTTP_COOKIE" => "legal_accepted=yes; product_admin={\"id\":#{@user.id},\"name\":\"#{@user.name}\",\"email\":\"#{@user.email}\"};" }
    assert_difference('Product.count', -1) do
      delete product_url(@product), headers: cookies_admin
    end

    assert_redirected_to products_url
  end
end
