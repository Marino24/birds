class NotepadsController < ApplicationController

  def index
    if Current.user
      @notepads = Current.user.notepads
      @notepad = Notepad.new
    else
      redirect_to prijava_path, notice: "Potrebna je prijava."
    end
  end

  def create
    @notepad = Current.user.notepads.build(notepad_params)
    if @notepad.save
      redirect_to belezka_path, notice: "Beležka ustvarjena."
    else
      @notepads = current_user.notepads
      render :index
    end
  end

  def update
    @notepad = Current.user.notepads.find(params[:id])
    if @notepad.update(notepad_params)
      redirect_to notepads_path, notice: "Beležka posodobljena."
    else
      render :index
    end
  end

  def destroy
    @notepad = Current.user.notepads.find(params[:id])
    @notepad.destroy
    redirect_to notepads_path, notice: "Beležka izbrisana."
  end


  private

  def notepad_params
    params.require(:notepad).permit(:name, :text)
  end


end
