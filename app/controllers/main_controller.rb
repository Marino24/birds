class MainController < ApplicationController
    def index
    end

    def change_background
        session[:background_color] = params[:color]
        redirect_back(fallback_location: root_path)
    end
end
