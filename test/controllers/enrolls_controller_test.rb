require 'test_helper'

class EnrollsControllerTest < ActionController::TestCase
  setup do
    @lecture = lectures(:one)
    @enroll = enrolls(:one)
  end

  test "should get index" do
    get :index, params: { lecture_id: @lecture }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { lecture_id: @lecture }
    assert_response :success
  end

  test "should create enroll" do
    assert_difference('Enroll.count') do
      post :create, params: { lecture_id: @lecture, enroll: @enroll.attributes }
    end

    assert_redirected_to lecture_enroll_path(@lecture, Enroll.last)
  end

  test "should show enroll" do
    get :show, params: { lecture_id: @lecture, id: @enroll }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { lecture_id: @lecture, id: @enroll }
    assert_response :success
  end

  test "should update enroll" do
    put :update, params: { lecture_id: @lecture, id: @enroll, enroll: @enroll.attributes }
    assert_redirected_to lecture_enroll_path(@lecture, Enroll.last)
  end

  test "should destroy enroll" do
    assert_difference('Enroll.count', -1) do
      delete :destroy, params: { lecture_id: @lecture, id: @enroll }
    end

    assert_redirected_to lecture_enrolls_path(@lecture)
  end
end
