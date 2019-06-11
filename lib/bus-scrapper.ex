defmodule Bus_scrapper do
	def search do
		IO.puts "In search module"
		sites = Fetch_data.intialize_sites
		sites = Fetch_data.fetch_sites_data
	end
end