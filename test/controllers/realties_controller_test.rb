require 'test_helper'

class RealtiesControllerTest < ActionController::TestCase
  setup do
    @realty = realties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:realties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create realty" do
    assert_difference('Realty.count') do
      post :create, realty: {  }
    end

    assert_redirected_to realty_path(assigns(:realty))
  end

  test "should show realty" do
    get :show, id: @realty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @realty
    assert_response :success
  end

  test "should update realty" do
    patch :update, id: @realty, realty: {  }
    assert_redirected_to realty_path(assigns(:realty))
  end

  test "should destroy realty" do
    assert_difference('Realty.count', -1) do
      delete :destroy, id: @realty
    end

    assert_redirected_to realties_path
  end
end
