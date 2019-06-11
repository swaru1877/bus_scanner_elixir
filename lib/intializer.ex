defmodule Yamerl_init do
	def func do
		IO.puts "Calling init module"
		:application.start(:yamerl)
		[sites_info | _ ] = :yamerl_constr.file "/Users/Anjusha/Desktop/Sriram/bus_scanner_elixir/config/target_websites.yaml"
		#sites_info
		#|> Enum.map fn x -> IO.inspect(x) end
		
		
	end
end
