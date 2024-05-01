class ApplicationController < ActionController::Base
    before_action :set_current_user
    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    before_action :set_background_color
    def set_background_color
        session[:background_color] ||= "white"
        @background_color = session[:background_color]
    end
end
