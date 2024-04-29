class RegistracijaController < ApplicationController
    def new
        @uporabnik = User.new
    end
    
    def create
        @uporabnik = User.new(user_params)
        if(@user.save)
            redirect_to root_path, notice: "Uspešno registrirani"
        else
            render :new
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
