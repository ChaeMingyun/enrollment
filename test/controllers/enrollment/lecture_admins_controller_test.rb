require 'test_helper'

module Enrollment
  class LectureAdminsControllerTest < ActionController::TestCase
    setup do
      @lecture_admin = enrollment_lecture_admins(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:lecture_admins)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create lecture_admin" do
      assert_difference('LectureAdmin.count') do
        post :create, lecture_admin: {  }
      end

      assert_redirected_to lecture_admin_path(assigns(:lecture_admin))
    end

    test "should show lecture_admin" do
      get :show, id: @lecture_admin
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @lecture_admin
      assert_response :success
    end

    test "should update lecture_admin" do
      patch :update, id: @lecture_admin, lecture_admin: {  }
      assert_redirected_to lecture_admin_path(assigns(:lecture_admin))
    end

    test "should destroy lecture_admin" do
      assert_difference('LectureAdmin.count', -1) do
        delete :destroy, id: @lecture_admin
      end

      assert_redirected_to lecture_admins_path
    end
  end
end
