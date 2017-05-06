require 'test_helper'

class LecturesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
    @lecture = lectures(:one)
  end

  test "should get index" do
    get :index, params: { category_id: @category }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { category_id: @category }
    assert_response :success
  end

  test "should create lecture" do
    assert_difference('Lecture.count') do
      post :create, params: { category_id: @category, lecture: @lecture.attributes }
    end

    assert_redirected_to category_lecture_path(@category, Lecture.last)
  end

  test "should show lecture" do
    get :show, params: { category_id: @category, id: @lecture }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { category_id: @category, id: @lecture }
    assert_response :success
  end

  test "should update lecture" do
    put :update, params: { category_id: @category, id: @lecture, lecture: @lecture.attributes }
    assert_redirected_to category_lecture_path(@category, Lecture.last)
  end

  test "should destroy lecture" do
    assert_difference('Lecture.count', -1) do
      delete :destroy, params: { category_id: @category, id: @lecture }
    end

    assert_redirected_to category_lectures_path(@category)
  end
end
