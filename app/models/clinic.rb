class Clinic

	require 'csv'

	attr_accessor :name, :hours, :address, :latitude, :longitude, :zip, :borough, :number

	def initialize(name)
		@name = name
		@zip = zip
		@borough = borough
		@number = number
	end

	def Clinic.all
		csv_text = File.read('clinics.csv')
		csv = CSV.parse(csv_text, headers: false)
		result = csv.map do |clinic|
		  c = Clinic.new(clinic[0])
		  if clinic[1].present?
		  	c.address = clinic[1]
		    c.latitude = clinic[7]
			c.longitude = clinic[8]
			c.name = clinic[0]
			c.zip = clinic[9]
			c.borough = clinic[2]
			c.number = clinic[3]
			c.hours = clinic[5]
		  else
		  	c.address = "Unknown"
		  end
		  c
		end
		result
	end
end