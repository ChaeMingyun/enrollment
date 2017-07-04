require_dependency "enrollment/application_controller"

module Enrollment
  class EnrollsController < ApplicationController
    before_action :set_enrolls
    before_action :set_enroll, only: [:show, :edit, :update, :destroy]

    # GET lectures/1/enrolls
    def index
      @enrolls = @lecture.enrolls
    end

    # GET lectures/1/enrolls/1
    def show
    end

    # GET lectures/1/enrolls/new
    def new
      @enroll = @lecture.enrolls.build(user_id: en_current_user.id).save
      redirect_to :back
    end

    # GET lectures/1/enrolls/1/edit
    def edit
    end

    # POST lectures/1/enrolls
    def create
      @enroll = @lecture.enrolls.build(enroll_params)

      if @enroll.save
        redirect_to([@enroll.lecture, @enroll], notice: 'Enroll was successfully created.')
      else
        render action: 'new'
      end
    end

    # PUT lectures/1/enrolls/1
    def update
      if @enroll.update_attributes(enroll_params)
        redirect_to([@enroll.lecture, @enroll], notice: 'Enroll was successfully updated.')
      else
        render action: 'edit'
      end
    end

    # DELETE lectures/1/enrolls/1
    def destroy
      @enroll.destroy

      redirect_to lecture_enrolls_url(@lecture)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_enrolls
        @lecture = Lecture.find(params[:lecture_id])
      end

      def set_enroll
        @enroll = @lecture.enrolls.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def enroll_params
        params.require(:enroll).permit(:user_id, :lecture)
      end
  end
end
