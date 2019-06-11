class Bus
  ATTR = [:fare, :seats, :departure_time, :arrival_time, :bus_type, :company, :rating]

  def initialize bus_data, result
    if result.format == 'json'
      @fare = eval "#{bus_data}.#{result.fare}"
      @seats = eval "#{bus_data}.#{result.seats}"
      @departure_time = eval "#{bus_data}.#{result.departure_time}"
      @arrival_time = eval "#{bus_data}.#{result.arrival_time}"
      @bus_type = eval "#{bus_data}.#{result.bus_type}"
      @company = eval "#{bus_data}.#{result.company}"
      @rating = eval "#{bus_data}.#{result.rating}"
    end
  end

  def to_json
    json = Hash.new
    ATTR.each do |attr|
      json[attr] = eval "@#{attr}"
    end
    json
  end
end
