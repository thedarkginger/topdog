require 'test_helper'

class Sports1sControllerTest < ActionController::TestCase
  setup do
    @sports1 = sports1s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sports1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sports1" do
    assert_difference('Sports1.count') do
      post :create, sports1: { answers: @sports1.answers, correcta: @sports1.correcta, question: @sports1.question, quizdate: @sports1.quizdate }
    end

    assert_redirected_to sports1_path(assigns(:sports1))
  end

  test "should show sports1" do
    get :show, id: @sports1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sports1
    assert_response :success
  end

  test "should update sports1" do
    patch :update, id: @sports1, sports1: { answers: @sports1.answers, correcta: @sports1.correcta, question: @sports1.question, quizdate: @sports1.quizdate }
    assert_redirected_to sports1_path(assigns(:sports1))
  end

  test "should destroy sports1" do
    assert_difference('Sports1.count', -1) do
      delete :destroy, id: @sports1
    end

    assert_redirected_to sports1s_path
  end
end
