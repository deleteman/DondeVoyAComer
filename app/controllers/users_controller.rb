class UsersController < ApplicationController

	def send_message 
		SystemMailer.home_message(current_user, params[:msg]).deliver
		flash[:notice] = "Mensaje enviado. Muchas gracias!"
		redirect_to request.referer
	end

  def index
  end

  def show
	  @user = User.find(params[:id])

	  respond_to do |format|
		  format.html 
	  end
  end

  def create
	   @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Profile Updated"
      redirect_to @user
    else
      render :action => 'new'
    end

  end

  def edit
  end

  def update
  end

end
