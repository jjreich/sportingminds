require 'test_helper'

class AccountabilityPartnershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accountability_partnership = accountability_partnerships(:one)
  end

  test "should get index" do
    get accountability_partnerships_url
    assert_response :success
  end

  test "should get new" do
    get new_accountability_partnership_url
    assert_response :success
  end

  test "should create accountability_partnership" do
    assert_difference('AccountabilityPartnership.count') do
      post accountability_partnerships_url, params: { accountability_partnership: { accountability_partner_id: @accountability_partnership.accountability_partner_id, create: @accountability_partnership.create, destroy: @accountability_partnership.destroy, user_id: @accountability_partnership.user_id } }
    end

    assert_redirected_to accountability_partnership_url(AccountabilityPartnership.last)
  end

  test "should show accountability_partnership" do
    get accountability_partnership_url(@accountability_partnership)
    assert_response :success
  end

  test "should get edit" do
    get edit_accountability_partnership_url(@accountability_partnership)
    assert_response :success
  end

  test "should update accountability_partnership" do
    patch accountability_partnership_url(@accountability_partnership), params: { accountability_partnership: { accountability_partner_id: @accountability_partnership.accountability_partner_id, create: @accountability_partnership.create, destroy: @accountability_partnership.destroy, user_id: @accountability_partnership.user_id } }
    assert_redirected_to accountability_partnership_url(@accountability_partnership)
  end

  test "should destroy accountability_partnership" do
    assert_difference('AccountabilityPartnership.count', -1) do
      delete accountability_partnership_url(@accountability_partnership)
    end

    assert_redirected_to accountability_partnerships_url
  end
end
