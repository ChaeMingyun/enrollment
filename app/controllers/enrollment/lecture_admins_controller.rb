require_dependency "enrollment/application_controller"

module Enrollment
  class LectureAdminsController < ApplicationController
    before_action :set_lecture_admin, only: [:show, :edit, :update, :destroy]

    # GET /lecture_admins
    def index
      @lecture_admins = LectureAdmin.all
    end

    # GET /lecture_admins/1
    def show
    end

    # GET /lecture_admins/new
    def new
      @lecture_admin = LectureAdmin.new
    end

    # GET /lecture_admins/1/edit
    def edit
    end

    # POST /lecture_admins
    def create
      @lecture_admin = LectureAdmin.new(lecture_admin_params)

      if @lecture_admin.save
        redirect_to @lecture_admin, notice: 'Lecture admin was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /lecture_admins/1
    def update
      if @lecture_admin.update(lecture_admin_params)
        redirect_to @lecture_admin, notice: 'Lecture admin was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /lecture_admins/1
    def destroy
      @lecture_admin.destroy
      redirect_to lecture_admins_url, notice: 'Lecture admin was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_lecture_admin
        @lecture_admin = LectureAdmin.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def lecture_admin_params
        params[:lecture_admin]
      end
  end
end
