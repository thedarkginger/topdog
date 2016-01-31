require 'test_helper'

class ChipzsControllerTest < ActionController::TestCase
  setup do
    @chipz = chipzs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chipzs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chipz" do
    assert_difference('Chipz.count') do
      post :create, chipz: { category: @chipz.category, prize: @chipz.prize, rank: @chipz.rank }
    end

    assert_redirected_to chipz_path(assigns(:chipz))
  end

  test "should show chipz" do
    get :show, id: @chipz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chipz
    assert_response :success
  end

  test "should update chipz" do
    patch :update, id: @chipz, chipz: { category: @chipz.category, prize: @chipz.prize, rank: @chipz.rank }
    assert_redirected_to chipz_path(assigns(:chipz))
  end

  test "should destroy chipz" do
    assert_difference('Chipz.count', -1) do
      delete :destroy, id: @chipz
    end

    assert_redirected_to chipzs_path
  end
end
