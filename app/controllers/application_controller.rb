class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter :set_generic_metatags

	def set_generic_metatags 
		@meta = Hash.new if @meta.nil?
  		@meta[:description] = "Guia online de locales de comida en Montevideo, Uruguay"
	  	@meta[:keywords] = "montevideo, salir a comer, guia de restaurants, carritos, cena, almuerzo, comida, turismo"
	end
end
