require_dependency "enrollment/application_controller"

module Enrollment
  class EnrollsController < ApplicationController
    before_action :set_enroll, only: [:show, :edit, :update, :destroy]

    # GET /enrolls
    def index
      @enrolls = Enroll.all
    end

    # GET /enrolls/1
    def show
    end

    # GET /enrolls/new
    def new
      @enroll = Enroll.new
    end

    # GET /enrolls/1/edit
    def edit
    end

    # POST /enrolls
    def create
      @enroll = Enroll.new(enroll_params)

      if @enroll.save
        redirect_to @enroll, notice: 'Enroll was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /enrolls/1
    def update
      if @enroll.update(enroll_params)
        redirect_to @enroll, notice: 'Enroll was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /enrolls/1
    def destroy
      @enroll.destroy
      redirect_to enrolls_url, notice: 'Enroll was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_enroll
        @enroll = Enroll.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def enroll_params
        params[:enroll]
      end
  end
end
