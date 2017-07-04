require 'test_helper'

class LectureAdminsControllerTest < ActionController::TestCase
  setup do
    @lecture = lectures(:one)
    @lecture_admin = lecture_admins(:one)
  end

  test "should get index" do
    get :index, params: { lecture_id: @lecture }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { lecture_id: @lecture }
    assert_response :success
  end

  test "should create lecture_admin" do
    assert_difference('LectureAdmin.count') do
      post :create, params: { lecture_id: @lecture, lecture_admin: @lecture_admin.attributes }
    end

    assert_redirected_to lecture_lecture_admin_path(@lecture, LectureAdmin.last)
  end

  test "should show lecture_admin" do
    get :show, params: { lecture_id: @lecture, id: @lecture_admin }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { lecture_id: @lecture, id: @lecture_admin }
    assert_response :success
  end

  test "should update lecture_admin" do
    put :update, params: { lecture_id: @lecture, id: @lecture_admin, lecture_admin: @lecture_admin.attributes }
    assert_redirected_to lecture_lecture_admin_path(@lecture, LectureAdmin.last)
  end

  test "should destroy lecture_admin" do
    assert_difference('LectureAdmin.count', -1) do
      delete :destroy, params: { lecture_id: @lecture, id: @lecture_admin }
    end

    assert_redirected_to lecture_lecture_admins_path(@lecture)
  end
end
