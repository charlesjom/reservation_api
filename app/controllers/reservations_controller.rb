class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ update destroy ]

  # GET /reservations
  def index
    @reservations = Reservation.all

    render json: @reservations
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find_by_code(reservation_params[:code])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      Reservation::ATTRIBUTES_EQUIVALENCE.each_with_object({}) do |(attr_name, alternate_name), hash|
        hash[attr_name] = params.dig(:reservation, attr_name) || 
                          params.dig(:reservation, alternate_name)
                          params.dig(alternate_name)
      end
    end

    def guest_params
      ReservaGuesttion::ATTRIBUTES_EQUIVALENCE.each_with_object({}) do |(attr_name, alternate_name), hash|
        hash[attr_name] = params.dig(:guest, attr_name) || 
                          params.dig(:guest, alternate_name) || 
                          params.dig(alternate_name)
      end
    end
end
