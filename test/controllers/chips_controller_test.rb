require 'test_helper'

class ChipsControllerTest < ActionController::TestCase
  setup do
    @chip = chips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chip" do
    assert_difference('Chip.count') do
      post :create, chip: { category: @chip.category, rank: @chip.rank, update: @chip.update, winnings: @chip.winnings }
    end

    assert_redirected_to chip_path(assigns(:chip))
  end

  test "should show chip" do
    get :show, id: @chip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chip
    assert_response :success
  end

  test "should update chip" do
    patch :update, id: @chip, chip: { category: @chip.category, rank: @chip.rank, update: @chip.update, winnings: @chip.winnings }
    assert_redirected_to chip_path(assigns(:chip))
  end

  test "should destroy chip" do
    assert_difference('Chip.count', -1) do
      delete :destroy, id: @chip
    end

    assert_redirected_to chips_path
  end
end
