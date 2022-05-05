class ReservationsController < ApplicationController
def index
    @user = current_user
    if @user.admin
    # provide a list of users and costumes to the view for the filter control - only for admins
    @users = User.all
    @costumes = Costume.all
    #filter reservations
    if !params[:user_id].blank? && !params[:costume_id].blank?
    @user = User.by_user(params[:user_id])
    @costume = Costume.by_costume(params[:costume_id])
    @reservations = Reservation.by_reservation_user_and_costume(@user.ids, @costume.ids)
    elsif !params [:user_id].blank?
        @user = User.by_user(params[:user_id])
        @reservations = Reservation.by_reservation_user(@user.ids)
    elsif !params [:costume_id].blank?
        @costume = Costume.by_costume(params[:costume_id])
        @reservations = Reservation.by_reservation_costume(@costume.ids)
    else
        @reservations = Reservation.all
    end
else
    #Display all the User's reservations for a non-admin User
    @reservations = User.find_by(id: @user_id).reservations
 end
end

def show
    if session[:curren_useer_id]
        @user = current_user
        @reservation = Reservation.find_by(id: params[:id])
    else
        redirect_to '/login'
    end
end

def new
    @reservation = Reservation.new
    @user = current_user
    #Sets the costume based on the costume#show where 'Rent/Reserve This Costume' link was cliked.
    @costume = Costume.find_by(id: params[:costume][:costume_id])
end

def create
    #Creates initial Reservation from Costumes#show view page form
    @reservation = Reservation.new(reservation_params)
    @reservation.costume_id = params[:costume_id]
    @reservation.user_id = current_user

    if @reservation.save
      redirect_to costume_path(@costume)
    else
    #Renders the edit Reservation form for the user to finish filling out the Reservation details
    render :new
    end
end

def edit
    #Only Admins can edit Reservations
    @user = current_user
    @reseravtion = Reservation.find_by(id: params[:id])
    @costume = @reservation.costume
    render :edit
end

def update
    @reservation  = Reservation.find_by(id: params[:id])
    @costume = Costume.find_by(id: reservation_params[:costume_id])
    @reservation.update(user_id: reservation_params[:user_id],
                        costume_id: reservation_params[:costume_id],
                        status: reservation_params[:status],
                        start_date: reservation_params[:start_date],
                        end_date: reservation_params[:end_date],
                        message: reservation_params[:message],
                        owner_id: reservation_params[:owner_id])

  if @reservation.start_date != nil && @reservation.end_date != nil

  if @reservation.valid?
      flash[:succes] = "You have succesfully made your Rental Reservation!"
      redirect_to reservation_path(@reseravtion)
  else
      flash[:error] = "Please check your input data and try again."
      redirect_to edit_reservation_path(@reseravtion)
  end
      flash[:error] = "Please input a valid Start Date and End Date."
      render :edit
end

def destroy
    Reservation.find_by(id: params[:id]).destroy
    redirect_to user_path(current_user)
end

  private

      def reservation_params
          params.require(:reservation).permit(:user_id, :costume_id, :start_date, :end_date)
      end

    end

end
