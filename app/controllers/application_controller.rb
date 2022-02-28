class ApplicationController < ActionController::Base

    # this makes current_user available to View as well, not just in controller
    helper_method :current_user, :logged_in?

    def current_user
        # if you have a @current_user already, it returns @current_user.
        # if you dont't have, it execute after ||=
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        # turing current_user into boolean
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action"
            redirect_to login_path
        end
    end
end
