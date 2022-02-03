require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  setup do
    @product = products(:one)
    @user = users(:one)
  end

  test "visiting the index" do
    visit "/login"
    fill_in "email", with: @user.email
    fill_in "Password", with: @user.password
    click_on "Login"
    visit products_url
    assert_text "New Product"
  end

  test "creating a Product" do
    visit "/login"
    fill_in "email", with: @user.email
    fill_in "Password", with: @user.password
    click_on "Login"

    visit products_url
    click_on 'New Product'

    fill_in "Name", with: @product.name
    fill_in "Image", with: @product.image
    fill_in "Purchase price", with: @product.purchase_price
    fill_in "Quantity", with: @product.quantity
    fill_in "Sale price", with: @product.sale_price
    click_on "Save"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Name", with: @product.name
    fill_in "Purchase price", with: @product.purchase_price
    fill_in "Quantity", with: @product.quantity
    fill_in "Sale price", with: @product.sale_price
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
