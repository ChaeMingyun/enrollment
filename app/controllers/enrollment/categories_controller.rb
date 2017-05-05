require_dependency "enrollment/application_controller"

module Enrollment
  class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    # GET /categories
    def index
      @categories = EnrollmentCategory.all
    end

    # GET /categories/1
    def show
    end

    # GET /categories/new
    def new
      @category = EnrollmentCategory.new
    end

    # GET /categories/1/edit
    def edit
    end

    # POST /categories
    def create
      @category = EnrollmentCategory.new(category_params)

      if @category.save
        redirect_to @category, notice: 'EnrollmentCategory was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /categories/1
    def update
      if @category.update(category_params)
        redirect_to @category, notice: 'EnrollmentCategory was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /categories/1
    def destroy
      @category.destroy
      redirect_to categories_url, notice: 'EnrollmentCategory was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = EnrollmentCategory.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def category_params
        params.require(:enrollment_category).permit(:name, :info)
      end
  end
end
