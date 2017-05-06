class LecturesController < ApplicationController
  before_action :set_lectures
  before_action :set_lecture, only: [:show, :edit, :update, :destroy]

  # GET categories/1/lectures
  # GET /lectures
  def index
    if !params[:category_id].nil?
      @lectures = Lecture.find_by_category_id(params[:category_id])
    else
      @lectures = Lecture.all
    end
  end

  # GET categories/1/lectures/1
  def show
    @lecture = Lecture.all
  end

  # GET categories/1/lectures/new
  def new
    @lecture = @category.lectures.build
  end

  # GET categories/1/lectures/1/edit
  def edit
  end

  # POST categories/1/lectures
  def create
    @lecture = @category.lectures.build(lecture_params)

    if @lecture.save
      redirect_to([@lecture.category, @lecture], notice: 'Lecture was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT categories/1/lectures/1
  def update
    if @lecture.update_attributes(lecture_params)
      redirect_to([@lecture.category, @lecture], notice: 'Lecture was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE categories/1/lectures/1
  def destroy
    @lecture.destroy

    redirect_to category_lectures_url(@category)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lectures
    @category = Category.find(params[:category_id])
  end

  def set_lecture
    @lecture = @category.lectures.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def lecture_params
    params.require(:lecture).permit(:name, :info, :url, :content, :time_limit_start, :time_limit_end, :personnel_limit, :limit_on_ruby, :category)
  end

end
