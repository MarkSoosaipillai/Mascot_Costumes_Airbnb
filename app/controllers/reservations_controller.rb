class ReservationsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :cancel]
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
    @reservation = Reservation.new(booking_params)
    @reservation.user = @user
    @reservation.costume = Costume.find(params[:costume_id])
    @reservation.status = "Rented"
 if @reservation.save!
      redirect_to reservations_path
else
      render :new
 end
end

def edit; end

def update
    @reservation.update(reservation_params)

    redirect_to reservations_path
end

def cancel
    @reservation.status = "Canceled"
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

def find_booking
    @reservation = Reservation.find(params[:id])
end
end
