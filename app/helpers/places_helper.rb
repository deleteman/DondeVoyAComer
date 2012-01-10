module PlacesHelper

	def get_place_type_text value
		names = {:bar => "Bar", :rest => "Restaurante", :fast => "Comida rapida", :car => "Carrito"}
		names[value.to_sym]
	end
end
