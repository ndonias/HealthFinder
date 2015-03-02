class Clinic

	def self.all
		# Authorizes with OAuth and gets an access token.
		client = Google::APIClient.new
		auth = client.authorization
		auth.client_id = ENV["CLINIC_CLIENT_ID"]
		auth.client_secret = ENV["CLINIC_CLIENT_SECRET"]
		auth.scope =
		    "https://www.googleapis.com/auth/drive " +
		    "https://spreadsheets.google.com/feeds/"
		auth.redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
		# print("1. Open this page:\n%s\n\n" % auth.authorization_uri)
		# print("2. Enter the authorization code shown in the page: ")
		# auth.code = $stdin.gets.chomp
		# auth.fetch_access_token!
		# puts "*" * 40
		# puts auth.access_token
		# puts "*" * 40
		access_token = ENV["CLINIC_ACCESS_TOKEN"]

		# Creates a session.
		session = GoogleDrive.login_with_oauth(access_token)

		# First worksheet of
		# https://docs.google.com/spreadsheets/d/1SSW62yek7W45phsgcaZwBdo4Buyx9-DvLQRCmxGJYYE
		ws = session.spreadsheet_by_key("1SSW62yek7W45phsgcaZwBdo4Buyx9-DvLQRCmxGJYYE").worksheets[0]
	end

end