require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    cookies_admin = {"HTTP_COOKIE" => "legal_accepted=yes; product_admin={\"id\":#{@user.id},\"name\":\"#{@user.name}\",\"email\":\"#{@user.email}\"};"}
    get users_url, headers: cookies_admin
    assert_response :success
  end

  test "should get new" do
    cookies_admin = {"HTTP_COOKIE" => "legal_accepted=yes; product_admin={\"id\":#{@user.id},\"name\":\"#{@user.name}\",\"email\":\"#{@user.email}\"};"}
    get new_user_url, headers: cookies_admin
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      cookies_admin = {"HTTP_COOKIE" => "legal_accepted=yes; product_admin={\"id\":#{@user.id},\"name\":\"#{@user.name}\",\"email\":\"#{@user.email}\"};"}
      post users_url, headers: cookies_admin, params: { user: { email: @user.email, name: @user.name, password: @user.password } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    cookies_admin = {"HTTP_COOKIE" => "legal_accepted=yes; product_admin={\"id\":#{@user.id},\"name\":\"#{@user.name}\",\"email\":\"#{@user.email}\"};"}
    get user_url(@user), headers: cookies_admin
    assert_response :success
  end

  test "should get edit" do
    cookies_admin = {"HTTP_COOKIE" => "legal_accepted=yes; product_admin={\"id\":#{@user.id},\"name\":\"#{@user.name}\",\"email\":\"#{@user.email}\"};"}
    get edit_user_url(@user), headers: cookies_admin
    assert_response :success
  end

  test "should update user" do
    cookies_admin = {"HTTP_COOKIE" => "legal_accepted=yes; product_admin={\"id\":#{@user.id},\"name\":\"#{@user.name}\",\"email\":\"#{@user.email}\"};"}
    patch user_url(@user),headers: cookies_admin, params: { user: { email: @user.email, name: @user.name, password: @user.password } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    cookies_admin = {"HTTP_COOKIE" => "legal_accepted=yes; product_admin={\"id\":#{@user.id},\"name\":\"#{@user.name}\",\"email\":\"#{@user.email}\"};"}
    assert_difference('User.count', -1) do
      delete user_url(@user), headers: cookies_admin
    end

    assert_redirected_to users_url
  end
end
