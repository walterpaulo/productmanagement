require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'validates user creation' do
    user = User.new(name: 'user', email: 'user@example.com.br', password: '123123')
    assert user.save
    user_count = User.where(name: 'user')
    assert(1, user_count)
  end

  test 'Create and validate fields' do
    product = User.new
    assert_not product.save
  end

  test 'update user' do
    user_update = User.find(1)
    user_update.name = 'pedro'
    user_update.save
    assert User.where(name: 'pedro').present?
  end

  test 'delete product' do
    user_delete = User.find(1)
    user_delete.destroy
    assert_not User.find_by(id: 1).present?
  end
end
