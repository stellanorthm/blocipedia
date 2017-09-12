class UsersController < ApplicationController

  has_many :wikis

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # UserMailer will send a welcome email after save
        UserMailer.welcome_email(@user).deliver_now

        format.html { redirect_to(root_path, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
