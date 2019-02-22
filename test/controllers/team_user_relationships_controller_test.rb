require 'test_helper'

class TeamUserRelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_user_relationship = team_user_relationships(:one)
  end

  test "should get index" do
    get team_user_relationships_url
    assert_response :success
  end

  test "should get new" do
    get new_team_user_relationship_url
    assert_response :success
  end

  test "should create team_user_relationship" do
    assert_difference('TeamUserRelationship.count') do
      post team_user_relationships_url, params: { team_user_relationship: { team_id: @team_user_relationship.team_id, user_id: @team_user_relationship.user_id } }
    end

    assert_redirected_to team_user_relationship_url(TeamUserRelationship.last)
  end

  test "should show team_user_relationship" do
    get team_user_relationship_url(@team_user_relationship)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_user_relationship_url(@team_user_relationship)
    assert_response :success
  end

  test "should update team_user_relationship" do
    patch team_user_relationship_url(@team_user_relationship), params: { team_user_relationship: { team_id: @team_user_relationship.team_id, user_id: @team_user_relationship.user_id } }
    assert_redirected_to team_user_relationship_url(@team_user_relationship)
  end

  test "should destroy team_user_relationship" do
    assert_difference('TeamUserRelationship.count', -1) do
      delete team_user_relationship_url(@team_user_relationship)
    end

    assert_redirected_to team_user_relationships_url
  end
end
