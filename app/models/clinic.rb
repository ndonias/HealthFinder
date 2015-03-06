class Clinic

	attr_accessor :name, :address, :latitude, :longitude, :zip, :borough, :number

	def initialize(name)
		@name = name
		@zip = zip
		@borough = borough
		@number = number
		# @latitude = latitude
		# @longitude = longitude
	end

	# def self.all
	# 	CSV.foreach('clinics.csv') do |clinic|
	# 	  c = Clinic.new(clinic[0])
	# 	  if clinic[1].present?
	# 	  	c.address = clinic[1]
	# 	    c.latitude = clinic[7]
	# 		c.longitude = clinic[8]
	# 	  else
	# 	  	c.address = "Unknown"
	# 	  end
	# 	  c
	# 	end
	# end

	def Clinic.all
		# Authorizes with OAuth and gets an access token.
		client = Google::APIClient.new
		auth = client.authorization
		auth.client_id = ENV["CLINIC_CLIENT_ID"]
		auth.client_secret = ENV["CLINIC_CLIENT_SECRET"]
		auth.scope =
		    "https://www.googleapis.com/auth/drive " +
		    "https://spreadsheets.google.com/feeds/"
		# auth.redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
		# print("1. Open this page:\n%s\n\n" % auth.authorization_uri)
		# print("2. Enter the authorization code shown in the page: ")
		# auth.code = $stdin.gets.chomp
		# auth.fetch_access_token!
		# puts "*" * 40
		# puts auth.access_token
		# puts "*" * 40
		access_token = "ya29.LgGHlkLsfwcHWGDA-QD5FzXLfjPxJF-7qoVhiH3JZTiYpvrH8rrKkWvy_XlWnfN97-t7FqXVyMYTDg"
		# ENV["CLINIC_ACCESS_TOKEN"]
		# Creates a session.
		session = GoogleDrive.login_with_oauth(access_token)

		# First worksheet of
		# https://docs.google.com/spreadsheets/d/1SSW62yek7W45phsgcaZwBdo4Buyx9-DvLQRCmxGJYYE
		ws = session.spreadsheet_by_key("1SSW62yek7W45phsgcaZwBdo4Buyx9-DvLQRCmxGJYYE").worksheets[0]
		ws.rows
		result = ws.rows.map do |clinic|
		  c = Clinic.new(clinic[0])
		  if clinic[1].present?
		  	c.address = clinic[1]
		    c.latitude = clinic[7]
			c.longitude = clinic[8]
			c.name = clinic[0]
			c.zip = clinic[9]
			c.borough = clinic[2]
			c.number = clinic[3]
		  else
		  	c.address = "Unknown"
		  end
		  c
		end
		result
	end


end