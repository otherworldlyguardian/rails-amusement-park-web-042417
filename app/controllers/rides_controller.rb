class RidesController < ApplicationController
  def create
    user = current_user
    attraction = Attraction.find(params[:attraction_id])
    ride = Ride.new(user: user, attraction: attraction)
    message = ride.take_ride
    if message == "Thanks for riding the #{attraction.name}!"
      ride.save
      redirect_to user_path(user), notice: message
    else
      flash[:error] = message
      redirect_to user_path(user)
    end

  end
end
