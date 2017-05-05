class LectureAdminsController < ApplicationController
  before_action :set_lecture_admins
  before_action :set_lecture_admin, only: [:show, :edit, :update, :destroy]

  # GET lectures/1/lecture_admins
  # GET /lecture_admins
  def index
    if !params[:user_id].nil?
      # 유저의 경우, 누가 어떤 강의의 관리자인지 보여준다
      @lecture_admins = LectureAdmin.find_by_user_id(params[:user_id])
    elsif !params[lecture_id].nil?
      # 강의의 경우, 강의의 관리자가 누구인지 보여준다
      @lecture_admins = LectureAdmin.find_by_lecture_id(params[:lecture_id])
    end
  end

  # GET lectures/1/lecture_admins/1
  def show
  end

  # GET lectures/1/lecture_admins/new
  def new
    @lecture_admin = @lecture.lecture_admins.build
  end

  # GET lectures/1/lecture_admins/1/edit
  def edit
  end

  # POST lectures/1/lecture_admins
  def create
    @lecture_admin = @lecture.lecture_admins.build(lecture_admin_params)

    if @lecture_admin.save
      redirect_to([@lecture_admin.lecture, @lecture_admin], notice: 'Lecture admin was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT lectures/1/lecture_admins/1
  def update
    if @lecture_admin.update_attributes(lecture_admin_params)
      redirect_to([@lecture_admin.lecture, @lecture_admin], notice: 'Lecture admin was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE lectures/1/lecture_admins/1
  def destroy
    @lecture_admin.destroy

    redirect_to lecture_lecture_admins_url(@lecture)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lecture_admins
    @lecture = Lecture.find(params[:lecture_id])
  end

  def set_lecture_admin
    @lecture_admin = @lecture.lecture_admins.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def lecture_admin_params
    params.require(:lecture_admin).permit(:user_id, :lecture)
  end
end
