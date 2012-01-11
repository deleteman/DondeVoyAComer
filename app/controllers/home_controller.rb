class HomeController < ApplicationController

  def index
	  @meta[:title] = "DondeVoyAComer.com | Encontra el mejor lugar para ir a comer"
	  @recommended_places = Place.find(:all, :joins => :reviews, :select => "places.*, avg(reviews.points) as votos", :group => "places.id", :order => "votos DESC", :limit => 3)
	  @current_page = "home"
  end
  def se_viene
	@meta[:title] = "DondeVoyAComer.com | Mejoras a venir"
	respond_to do |format| 
		  format.html
	  end

  end
  def tenes_local
	@meta[:title] = "DondeVoyAComer.com | ¿Tenes un local comercial?"
	  respond_to do |format| 
		  format.html
	  end
  end

  def ayuda
	@meta[:title] = "DondeVoyAComer.com | Ayuda sobre el sitio"
	  @current_page = "ayuda"
	  respond_to do |format| 
		  format.html
	  end
  end

end