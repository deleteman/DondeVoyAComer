require 'test_helper'

class WorkingDaysControllerTest < ActionController::TestCase
  setup do
    @working_day = working_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:working_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create working_day" do
    assert_difference('WorkingDay.count') do
      post :create, :working_day => @working_day.attributes
    end

    assert_redirected_to working_day_path(assigns(:working_day))
  end

  test "should show working_day" do
    get :show, :id => @working_day.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @working_day.to_param
    assert_response :success
  end

  test "should update working_day" do
    put :update, :id => @working_day.to_param, :working_day => @working_day.attributes
    assert_redirected_to working_day_path(assigns(:working_day))
  end

  test "should destroy working_day" do
    assert_difference('WorkingDay.count', -1) do
      delete :destroy, :id => @working_day.to_param
    end

    assert_redirected_to working_days_path
  end
end
