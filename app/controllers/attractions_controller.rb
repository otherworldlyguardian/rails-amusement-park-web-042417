class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @a = Attraction.new(attraction_params)
    if @a.save
      redirect_to attraction_path(@a)
    else
      redirect_to new_attraction_path
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @a = Attraction.find(params[:id])
    if @a.update(attraction_params)
      redirect_to attraction_path(@a)
    else
      redirect_to edit_attraction_path
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
