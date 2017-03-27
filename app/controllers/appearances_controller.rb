class AppearancesController < ApplicationController
  before_action :set_appearance, only: [:show, :edit, :update, :destroy]



  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)

    if @appearance.save
      redirect_to @appearance.episode
    else
      flash[:error] = @appearance.errors
      redirect_to new_appearance_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if  @appearance.update(appearance_params)
      redirect_to @appearance
    else
      flash[:error] = @appearance.errors
      redirect_to edit_appearance_path(@appearance)
    end
  end

  def destroy
    @appearance.destroy
    redirect_to new_appearance_path
  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating, :user_id)
  end

  def set_appearance
    @appearance = Appearance.find_by(id: params[:id])
  end

end
