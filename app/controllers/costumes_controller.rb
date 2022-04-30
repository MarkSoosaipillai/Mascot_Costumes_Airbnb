class CostumesController < ApplicationController

  before_action :set_costume, only: [:show, :edit, :update, :destroy]

  def index
    @Costumes = Costume.all
  end


  def show
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.save
    # no need for app/views/costumes/create.html.erb
    redirect_to costume_path(@costume)
  end

  def update
    @costume.update(costume_params)
  end

  def destroy
    @costume.destroy
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
    params.require(:costume).permit(:name, :descr, :price, :size, :category, :user_id)
  end

end