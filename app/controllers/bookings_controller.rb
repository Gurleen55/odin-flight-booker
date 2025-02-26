class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    params[:number_of_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    puts params.inspect
    @booking = Booking.new(booking_params)

    if @booking.save
      booking = Booking.last
      puts booking.passengers.inspect
      redirect_to booking_path(@booking), notice: "Booking Saved Successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end
  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email ])
  end
end
