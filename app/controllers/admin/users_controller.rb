module Admin
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy, :update_password]

    def index
      @users = User.order(:name)
    end

    def show
    end

    def new
      @user = User.new
    end

    def edit
    end

    def create
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to admin_users_url, notice: "User #{@user.name} was successfully created." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
       respond_to do |format|
         if
           @user.update(user_params)
            format.html { redirect_to admin_users_url, notice: "User #{@user.name} was successfully updated." }
            format.json { render :show, status: :ok, location: @user }
         else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
         end
      end
    end

    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    rescue_from 'User::Error' do |exception|
      redirect_to admin_users_url, notice: exception.message
    end

    def update_password
      current_password = user_params[:current_password]
      if current_password.present? && @user.authenticate(current_password)
        @user.update(user_params)
        redirect_to admin_users_url, notice: "Password #{@user.name}'s was successfully updated."
      else
        redirect_to edit_admin_user_path(@user.id), notice: 'Current password not valid'
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :current_password, :admin).to_hash
    end
  end
end