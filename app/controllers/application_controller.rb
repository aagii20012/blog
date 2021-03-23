class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?
    def current_user  
        return unless session[:user_id]  
        @current_user ||= User.find(session[:user_id])  
    end
    def logged_in?
        !!current_user
    end
    def require_user
        if !logged_in?
            flash[:danger] = "You must be logged in to perform that action"
            redirect_to root_path
        end
    end
    def banner_show
        @id=rand(Banner.last.try(:id))
        @id=@id+1
        @randam_val=Banner.find(@id);
        @id=rand(1..3)
    end
end