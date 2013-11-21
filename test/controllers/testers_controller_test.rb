require 'test_helper'

class TestersControllerTest < ActionController::TestCase
  setup do
    @tester = testers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tester" do
    assert_difference('Tester.count') do
      post :create, tester: {  }
    end

    assert_redirected_to tester_path(assigns(:tester))
  end

  test "should show tester" do
    get :show, id: @tester
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tester
    assert_response :success
  end

  test "should update tester" do
    patch :update, id: @tester, tester: {  }
    assert_redirected_to tester_path(assigns(:tester))
  end

  test "should destroy tester" do
    assert_difference('Tester.count', -1) do
      delete :destroy, id: @tester
    end

    assert_redirected_to testers_path
  end
end
