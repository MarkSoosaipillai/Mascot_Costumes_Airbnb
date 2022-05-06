class CostumesController < ApplicationController
  before_action :set_user
  before_action :set_costume, only: [:show, :edit, :update, :destroy]
  def home
    @costumes = Costume.all
  end

  def index
    @costumes = Costume.all
  end

  def show
    @reservation = Reservation.new
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user

    # if @costume.image.nil?
    #   @costume.image = "gritty.jpg"
    # end


    if @costume.save
       redirect_to costume_path(@costume)
    else
      flash[:error] = "wrong inputs, try again"
    end
    # no need for app/views/costumes/create.html.erb
  end

  def update
    @costume.update(costume_params)
  end

  def destroy
    @costume.destroy
    redirect_to costumes_path
  end

  def list_by_user
    @costumes = Costume.where(user_id: params[:user_id])
  end

  def my_costumes
    @costumes = Costume.where(user_id: params[:user_id])
  end

  private

  def set_costume
    @costume = Costume.find(params[:id])
  end

  def costume_params
    params.require(:costume).permit(:name, :descr, :price, :size, :category, :user_id, images: [])
  end

  def set_user
    @user = current_user
  end
end
