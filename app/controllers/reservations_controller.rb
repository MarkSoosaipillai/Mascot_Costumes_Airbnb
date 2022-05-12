class ReservationsController < ApplicationController
  before_action :find_reservation, only: [:show, :edit, :update, :cancel, :approved]
  before_action :find_user
  before_action :find_costume, only: [:new, :create]

def index
   @my_reservations = Reservation.where(user_id:current_user).where.not(status:"Rejected")
    my_costume_ids = Costume.where(user_id:current_user).pluck(:id)
    @my_requests = []

   my_costume_ids.each do |id|
      matching_results =  Reservation.where(costume_id:id).where.not(status:"Rejected")
      matching_results.each do |result|
        @my_requests << result
      end
   end
   ##Following variables are a count of reservation/requests belonging to the user where the status is not Rejected
  #  @my_reservation_count = Reservation.where(user_id:current_user).where.not(status:"Rejected").count
  #  @my_requests_count = @my_requests.where.not(status:"Rejected").count


end
def show; end
def new
    @reservation = Reservation.new
end

def create
    @owner = @costume.user
    @other_costumes_by_owner = @owner.costumes - [@costume]
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.costume = @costume
    @reservation.status = "Pending"
    if @reservation.save
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
    redirect_to reservations_path(@reservation, anchor: '#request')
end
def approved
    @reservation.status = "Approved"
    @reservation.save!
    redirect_to reservations_path(@reservation, anchor: '#request')
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

def find_costume
  @costume = Costume.find(params[:costume_id])
end
end
