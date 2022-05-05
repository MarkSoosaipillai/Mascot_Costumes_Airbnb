class ReservationsController < ApplicationController
  before_action :find_reservation, only: [:show, :edit, :update, :cancel, :approved]
  before_action :find_user

def index
   @reservations = Reservation.all
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
