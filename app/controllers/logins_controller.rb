class LoginsController < ApplicationController
  skip_before_action :require_user, only: [ :new, :create ]
  def new
  end

  def create
    @student = Student.find_by(email: params[:login][:email])
    if @student && @student.authenticate(params[:login][:password])
      session[:student_id] = @student.id
      flash[:success] = "You have successfully logged in"
      redirect_to courses_path
    else
      flash[:error] = "Your credentials are not correct"
      render :new
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = "logged out!!"
    redirect_to login_path
  end
end
