require 'test_helper'

class TriviaDemosControllerTest < ActionController::TestCase
  setup do
    @trivia_demo = trivia_demos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trivia_demos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trivia_demo" do
    assert_difference('TriviaDemo.count') do
      post :create, trivia_demo: { answer1: @trivia_demo.answer1, answer2: @trivia_demo.answer2, answer3: @trivia_demo.answer3, answer4: @trivia_demo.answer4, correcta: @trivia_demo.correcta, order: @trivia_demo.order, published: @trivia_demo.published, question: @trivia_demo.question }
    end

    assert_redirected_to trivia_demo_path(assigns(:trivia_demo))
  end

  test "should show trivia_demo" do
    get :show, id: @trivia_demo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trivia_demo
    assert_response :success
  end

  test "should update trivia_demo" do
    patch :update, id: @trivia_demo, trivia_demo: { answer1: @trivia_demo.answer1, answer2: @trivia_demo.answer2, answer3: @trivia_demo.answer3, answer4: @trivia_demo.answer4, correcta: @trivia_demo.correcta, order: @trivia_demo.order, published: @trivia_demo.published, question: @trivia_demo.question }
    assert_redirected_to trivia_demo_path(assigns(:trivia_demo))
  end

  test "should destroy trivia_demo" do
    assert_difference('TriviaDemo.count', -1) do
      delete :destroy, id: @trivia_demo
    end

    assert_redirected_to trivia_demos_path
  end
end
