# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


WorkingDay.delete_all
#Dias a cargar
[["Lunes", "Lun"], ["Martes", "Mar"], ["Mi&eacute;rcoles", "Mie"], ["Jueves", "Jue"], ["Viernes", "Vie"], ["S&aacute;bado", "Sab"], ["Domingo", "Dom"]].each do |d|
	WorkingDay.create({:name => d.first, :short_name => d.last})
end

Medal.delete_all

[{:code => "first_comment", :name => "Medalla de opini&oacute;n", :description => "Primer comentario a un local de comidas"},
 {:code => "first_place",  :name => "Medalla a la contribuci&oacute;n",:description => "Primer local de comidas ingresado"},
 {:code => "first_voted_comment", :name => "Medalla al soporte", :description => "Primer voto a un comentario"},
 {:code => "first_downvoted_comment", :name => "Medalla de cr&iacute;tico", :description => "Primer voto negativo a un comentario"}
 ].each { |m|
	 Medal.create(m)
 }