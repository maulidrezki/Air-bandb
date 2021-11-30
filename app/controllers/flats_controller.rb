class FlatsController < ApplicationController



  private

  def flat_params
    params.require(:flat).permit(:name, :location, :description, :price_per_night, :capacity, photos: [])
  end
end
