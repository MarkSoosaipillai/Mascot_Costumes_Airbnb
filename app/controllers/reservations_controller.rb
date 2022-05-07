class ReservationsController < ApplicationController
  before_action :find_reservation, only: [:show, :edit, :update, :cancel, :approved]
  before_action :find_user

def index
   @my_reservations = Reservation.where(user_id:current_user)
    my_costume_ids = Costume.where(user_id:current_user).pluck(:id)
    @my_requests = []

   my_costume_ids.each do |id|
      matching_results =  Reservation.where(costume_id:id)
      matching_results.each do |result|
        @my_requests << result
      end
   end


end
def show; end
def new
    @reservation = Reservation.new
    @costume = Costume.find(params[:costume_id])
end
def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.costume = Costume.find(params[:costume_id])
    @reservation.status = "Pending"
    if @reservation.save!
      redirect_to user_reservations_path(@user)
    else
      render 'costumes/show'
    end
end
def edit; end
def update
    @reservation.update(reservation_params)
    redirect_to reservations_path
end
def cancel
    @reservation.status = "Rejected"
    @reservation.save!
    redirect_to reservations_path
end
def approved
    @reservation.status = "Approved"
    @reservation.save!
    redirect_to reservations_path
end
private
def reservation_params
    params.require(:reservation).permit(:status, :start_date, :end_date)
end
def find_user
    @user = current_user
end
def find_reservation
    @reservation = Reservation.find(params[:id])
end
end
