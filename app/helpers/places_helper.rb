module PlacesHelper

	def get_place_type_text value
		names = {:bar => "Bar", :rest => "Restaurante", :piza => "Pizzeria",:fast => "Comida rapida", :car => "Carrito", :heladeria => "Heladeria"}
		names[value.to_sym]
	end
end
