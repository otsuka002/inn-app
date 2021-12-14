class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to :index, notice: "予約しました。"
    else
      render :new, alert: "予約されませんでした。"
    end
  end
  
  def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:start_day, :end_day, :people, :user_id, :proom_id, :total_price)
  end
  
end
