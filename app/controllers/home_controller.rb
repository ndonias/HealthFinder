class HomeController < ApplicationController
	def index
	  	@clinics = Clinic.all
	  	# @hash = Gmaps4rails.build_markers(@clinics) do |clinic, marker|
	  	# 	marker.lat clinic.latitude
  		# 	marker.lng clinic.longitude
  		# 	marker.infowindow clinic.name
	  	# end
		@hash = @clinics.map do |clinic|
			html = "<h4>#{clinic.name}</h4>Phone: #{clinic.number}</br>Address: #{clinic.address}"
			{lat: clinic.latitude.to_s, lng: clinic.longitude.to_s, 
			description: clinic.name, title: clinic.name, borough: clinic.borough,
			picture: {
	        	url: "http://icons.iconarchive.com/icons/medicalwp/medical/24/Hospital-blue-icon.png",
	        	width:  25,
	        	height: 25
      		}, 
			infowindow: html, sidebar: html}
     	end
     end
end
