module Admin
  class ApplicationController < ActionController::Base
    attr_reader :current_user

    layout 'admin'

    protected

    def authorize
      @current_user = User.find_by(id: session[:user_id])
      unless @current_user
        redirect_to login_url, notice: "Please log in"
      end
    end
  end
end
