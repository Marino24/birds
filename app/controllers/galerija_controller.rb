class GalerijaController < ApplicationController
    def galerijaIndex
        @slike = Picture.all
    end

    def new
        if Current.user
            @slika = Picture.new
        else
            redirect_to prijava_path, notice: "Potrebna je prijava."
        end
    end

    def create
        @slika = Current.user.pictures.new(picture_params)
        if @slika.save
            redirect_to root_path, notice: "Slika je bila uspešno naložena."
        else
            render :new, alert: "Napaka pri nalaganju slike."
        end
      end

    private

  def picture_params
    params.require(:picture).permit(:name, :image)
  end
end
