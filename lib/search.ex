defmodule Start_search do
	IO.puts "Started Running......."
	data = Bus_scrapper.search
	Yamerl_init.func
	IO.puts "Application done....."
end