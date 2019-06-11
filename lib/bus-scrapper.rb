require 'yaml'
require 'curb'
require 'pry'
require_relative 'bus-scrapper/initializer'
require_relative 'bus-scrapper/helper'
require_relative 'bus-scrapper/constants'
require_relative 'bus-scrapper/bus'
require_relative 'bus-scrapper/site'
require_relative 'bus-scrapper/fetch_data'

def search from, to, date
  sites = intialize_sites
  sites = fetch_sites_data sites, from, to, date
  cook sites
end
