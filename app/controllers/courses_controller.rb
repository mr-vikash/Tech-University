class CoursesController < ApplicationController

  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Course added successfully"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong !!"
      render :new
    end
  end

  def index
    @courses = Course.all
  end

  def show
  end

  def update
    if @course.update(course_params)
      flash[:notice] = "Course details updated successfully"
      redirect_to @course
    else
      flash[:error] = "Something went wrong !!"
      redirect_to :edit
    end
  end

  def destroy
    if @course.destroy
      flash[:notice] = "Course deleted successfully"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong !!"
      redirect_to @course
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:short_name, :name, :description)
  end
end