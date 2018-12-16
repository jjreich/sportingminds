require 'test_helper'

class GoalTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goal_type = goal_types(:one)
  end

  test "should get index" do
    get goal_types_url
    assert_response :success
  end

  test "should get new" do
    get new_goal_type_url
    assert_response :success
  end

  test "should create goal_type" do
    assert_difference('GoalType.count') do
      post goal_types_url, params: { goal_type: { name: @goal_type.name } }
    end

    assert_redirected_to goal_type_url(GoalType.last)
  end

  test "should show goal_type" do
    get goal_type_url(@goal_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_goal_type_url(@goal_type)
    assert_response :success
  end

  test "should update goal_type" do
    patch goal_type_url(@goal_type), params: { goal_type: { name: @goal_type.name } }
    assert_redirected_to goal_type_url(@goal_type)
  end

  test "should destroy goal_type" do
    assert_difference('GoalType.count', -1) do
      delete goal_type_url(@goal_type)
    end

    assert_redirected_to goal_types_url
  end
end
