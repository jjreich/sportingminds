require 'test_helper'

class TrainingTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @training_type = training_types(:one)
  end

  test "should get index" do
    get training_types_url
    assert_response :success
  end

  test "should get new" do
    get new_training_type_url
    assert_response :success
  end

  test "should create training_type" do
    assert_difference('TrainingType.count') do
      post training_types_url, params: { training_type: {  } }
    end

    assert_redirected_to training_type_url(TrainingType.last)
  end

  test "should show training_type" do
    get training_type_url(@training_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_training_type_url(@training_type)
    assert_response :success
  end

  test "should update training_type" do
    patch training_type_url(@training_type), params: { training_type: {  } }
    assert_redirected_to training_type_url(@training_type)
  end

  test "should destroy training_type" do
    assert_difference('TrainingType.count', -1) do
      delete training_type_url(@training_type)
    end

    assert_redirected_to training_types_url
  end
end
