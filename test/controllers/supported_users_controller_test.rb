require 'test_helper'

class SupportedUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supported_user = supported_users(:one)
  end

  test "should get index" do
    get supported_users_url
    assert_response :success
  end

  test "should get new" do
    get new_supported_user_url
    assert_response :success
  end

  test "should create supported_user" do
    assert_difference('SupportedUser.count') do
      post supported_users_url, params: { supported_user: {  } }
    end

    assert_redirected_to supported_user_url(SupportedUser.last)
  end

  test "should show supported_user" do
    get supported_user_url(@supported_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_supported_user_url(@supported_user)
    assert_response :success
  end

  test "should update supported_user" do
    patch supported_user_url(@supported_user), params: { supported_user: {  } }
    assert_redirected_to supported_user_url(@supported_user)
  end

  test "should destroy supported_user" do
    assert_difference('SupportedUser.count', -1) do
      delete supported_user_url(@supported_user)
    end

    assert_redirected_to supported_users_url
  end
end
