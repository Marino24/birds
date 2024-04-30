class SessionController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])

        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Uspešna prijava"
        else
            flash[:alert] = "Nepravilen email ali geslo"
            render :new
        end
    end
    
    
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Odjavleni"
    end


end