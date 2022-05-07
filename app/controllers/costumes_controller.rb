class CostumesController < ApplicationController
  before_action :set_user
  before_action :set_costume, only: [:show, :edit, :update, :destroy]

  def home
    @costumes = Costume.all
  end

  def index
    @costumes = Costume.all
    @markers = @costumes.geocoded.map do |costume|
        {
            lat: costume.latitude,
            lng: costume.longitude,
            info_window: render_to_string(partial: "info_window", locals: { costume: costume }),
            image_url: costume.images.first.present? ? costume.images.first.url : helpers.asset_url("unicorn.jpg")
          }
      end

    if params[:query].present?
      @costumes = Costume.search_by_name_and_descr(params[:query])
    else
      @costumes = Costume.all
    end

  end

  def show
    @reservation = Reservation.new
  end

  def new
    @costume = Costume.new
  end

  def create
    p costume_params
    @costume = Costume.new(costume_params)
    @costume.user = current_user

    # if @costume.image.nil?
    #   @costume.image = "gritty.jpg"
    # end
    if @costume.save
       redirect_to root_path
    else
      flash[:error] = "wrong inputs, try again"
    end
    # no need for app/views/costumes/create.html.erb
  end

  def edit
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

    params.require(:costume).permit(:name, :descr, :price, :size, :category, :user_id, :address, images: [])

  end

  def set_user
    @user = current_user
  end
end
