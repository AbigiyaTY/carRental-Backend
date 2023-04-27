class Api::V1::ReservationsController < ApplicationController
  skip_before_action :authenticate_request, only: %i[create index my_reservation history]
  def index
    reservations = Reservation.all
    render json: reservations
  end

  def my_reservation
    reservations = Reservation.all.where(user_id: params[:id])
    render json: reservations
  end

  def show
    reservation = Reservation.find(params[:id])
    render json: reservation, status: :ok
  end

  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save
      render json: { message: 'success' }, status: :created
    else
      render json: { message: 'error', errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    reservation = Reservation.find(params[:id])
    render json: { message: 'success' } if reservation.update(reservation_params)
    return if reservation.present?

    render json: { errors: reservation.errors.full_messages },
           status: :unprocessable_entity
  end

  def destroy
    reservation = Reservation.find(params[:id])
    if reservation.destroy
      render json: { message: 'success' }
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.permit(:start_date, :end_date, :user_id, :car_id)
  end
end
