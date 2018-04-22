require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
