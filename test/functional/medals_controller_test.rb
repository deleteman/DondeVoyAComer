require 'test_helper'

class MedalsControllerTest < ActionController::TestCase
  setup do
    @medal = medals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medal" do
    assert_difference('Medal.count') do
      post :create, :medal => @medal.attributes
    end

    assert_redirected_to medal_path(assigns(:medal))
  end

  test "should show medal" do
    get :show, :id => @medal.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @medal.to_param
    assert_response :success
  end

  test "should update medal" do
    put :update, :id => @medal.to_param, :medal => @medal.attributes
    assert_redirected_to medal_path(assigns(:medal))
  end

  test "should destroy medal" do
    assert_difference('Medal.count', -1) do
      delete :destroy, :id => @medal.to_param
    end

    assert_redirected_to medals_path
  end
end
