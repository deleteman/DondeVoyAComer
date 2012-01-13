module ApplicationHelper

	def print_page_title meta_array
		if meta_array.nil? || meta_array[:title].nil?
			return "DondeVoyAComer.com"
		else
			return meta_array[:title]
		end
	end

	def print_meta_data meta_array
		meta  = ""
		if !meta_array.nil?
			meta_array.each do |k,v|
				meta += "<meta name='#{k}' content='#{v}'/>"
			end
		end
		meta.html_safe
	end

	def is_current_page page, should_be
		if !page.nil? 
			if page == should_be
				return "current"
			end
		end
	end

	def places_types_dropdown selected_value, name = "place[place_type]"
		select_tag(name,options_for_select([["No importa",""], ["Bar","bar"], ["Restaurant", "rest"], ["Comida rapida", "fast"], ["Carrito", "car"]], :selected => selected_value))
	end

	def show_or_default value, def_value = nil
		if value.is_a?(Date) || value.is_a?(DateTime) || value.is_a?(Time)
			l value, :format => :short
		else
			global_default = def_value || "No disponible"
			if value.nil? || value.empty?
				global_default
			else
				value
			end

		end
	end

end

