require 'test_helper'

class InternalMessagesControllerTest < ActionController::TestCase
  setup do
    @internal_message = internal_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:internal_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create internal_message" do
    assert_difference('InternalMessage.count') do
      post :create, :internal_message => @internal_message.attributes
    end

    assert_redirected_to internal_message_path(assigns(:internal_message))
  end

  test "should show internal_message" do
    get :show, :id => @internal_message.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @internal_message.to_param
    assert_response :success
  end

  test "should update internal_message" do
    put :update, :id => @internal_message.to_param, :internal_message => @internal_message.attributes
    assert_redirected_to internal_message_path(assigns(:internal_message))
  end

  test "should destroy internal_message" do
    assert_difference('InternalMessage.count', -1) do
      delete :destroy, :id => @internal_message.to_param
    end

    assert_redirected_to internal_messages_path
  end
end
