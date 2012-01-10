class HomeController < ApplicationController

  def index
	  @recommended_places = Place.find(:all, :joins => :reviews, :select => "places.*, avg(reviews.points) as votos", :group => "places.id", :order => "votos DESC", :limit => 3)
	  @current_page = "home"
  end
  def se_viene
	respond_to do |format| 
		  format.html
	  end

  end
  def tenes_local
	  respond_to do |format| 
		  format.html
	  end
  end

  def ayuda
	  @current_page = "ayuda"
	  respond_to do |format| 
		  format.html
	  end
  end

end