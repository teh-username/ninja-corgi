require 'test_helper'

class MainControllerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about me" do
    get :about
    assert_response :success
  end

  test "should get portfolio" do
    get :portfolio
    assert_response :success
  end
end
