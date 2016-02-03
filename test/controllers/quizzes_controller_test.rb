require 'test_helper'

class QuizzesControllerTest < ActionController::TestCase
  setup do
    @quiz = quizzes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quizzes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quiz" do
    assert_difference('Quiz.count') do
      post :create, quiz: { category: @quiz.category, entry: @quiz.entry, first: @quiz.first, fourth: @quiz.fourth, game_start: @quiz.game_start, purse: @quiz.purse, second: @quiz.second, third: @quiz.third, topic: @quiz.topic, topic: @quiz.topic }
    end

    assert_redirected_to quiz_path(assigns(:quiz))
  end

  test "should show quiz" do
    get :show, id: @quiz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quiz
    assert_response :success
  end

  test "should update quiz" do
    patch :update, id: @quiz, quiz: { category: @quiz.category, entry: @quiz.entry, first: @quiz.first, fourth: @quiz.fourth, game_start: @quiz.game_start, purse: @quiz.purse, second: @quiz.second, third: @quiz.third, topic: @quiz.topic, topic: @quiz.topic }
    assert_redirected_to quiz_path(assigns(:quiz))
  end

  test "should destroy quiz" do
    assert_difference('Quiz.count', -1) do
      delete :destroy, id: @quiz
    end

    assert_redirected_to quizzes_path
  end
end
