def intialize_sites
  SITES.map { |site| Site.new site if site.enabled }.reject { |item| item.nil? }
end

def fetch_sites_data sites, from, to, date
  sites.map { |site| site.make_request(from, to, date) }
end

def parse_sites_raw_output sites
  sites.map { |site| site.cook_raw }
end

def cook sites
  sites.map { |site| { name: site.name, data: site.to_json } }
end
