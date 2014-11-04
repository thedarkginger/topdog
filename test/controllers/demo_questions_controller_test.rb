require 'test_helper'

class DemoQuestionsControllerTest < ActionController::TestCase
  setup do
    @demo_question = demo_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:demo_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create demo_question" do
    assert_difference('DemoQuestion.count') do
      post :create, demo_question: { answer: @demo_question.answer, creation: @demo_question.creation, order: @demo_question.order, question1: @demo_question.question1, question2: @demo_question.question2, question3: @demo_question.question3, question4: @demo_question.question4 }
    end

    assert_redirected_to demo_question_path(assigns(:demo_question))
  end

  test "should show demo_question" do
    get :show, id: @demo_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @demo_question
    assert_response :success
  end

  test "should update demo_question" do
    patch :update, id: @demo_question, demo_question: { answer: @demo_question.answer, creation: @demo_question.creation, order: @demo_question.order, question1: @demo_question.question1, question2: @demo_question.question2, question3: @demo_question.question3, question4: @demo_question.question4 }
    assert_redirected_to demo_question_path(assigns(:demo_question))
  end

  test "should destroy demo_question" do
    assert_difference('DemoQuestion.count', -1) do
      delete :destroy, id: @demo_question
    end

    assert_redirected_to demo_questions_path
  end
end
