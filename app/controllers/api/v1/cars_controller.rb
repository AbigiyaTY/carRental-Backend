class Api::V1::CarsController < ApplicationController
  before_action :check_car, only: %i[show destroy]
  skip_before_action :authenticate_request, only: %i[create index destroy]
  load_and_authorize_resource

  def index
    cars = Car.all
    render json: cars
  end

  def create
    car = Car.new(param_checker)
    if car.save
      render json: { message: 'success' }
    else
      render json: { message: 'error', error: car.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @car, status: :ok if @car.present?
    render json: { message: 'error', error: 'Record not found' }, status: :not unless @car.present?
  end

  def destroy
    if @car.destroy
      render json: { message: 'success' }, status: :ok
    else
      render json: { message: 'error' }, status: :unprocessable_entity
    end
  end

  def checkout_reservation
    reservation = Reservation.all.where(archived: false)
    reservation.each do |res|
      diff = (res.end_date - Date.today).to_i
      if diff.negative?
        res.update(archived: true)
        res.car.update(reserve: false)
      end
    end
    render json: { message: 'success' }
  end

  private

  def param_checker
    params.permit(:car_name, :model, :year, :color, :image, :price)
  end

  def check_car
    @car = Car.find(params[:id])
  end
end
