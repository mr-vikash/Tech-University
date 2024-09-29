class StudentCoursesController < ApplicationController
  def create
    course_to_add = Course.find(params[:course_id])
    unless current_user.courses.include?(course_to_add)
      StudentCourse.create(course: course_to_add, student: current_user)
      flash[:notice] = "You successfully enrolled in #{course_to_add.short_name}"
      redirect_to current_user
    else
      flash[:error] = "Something went wrong with your enrollment"
      redirect_to courses
    end
  end
end
