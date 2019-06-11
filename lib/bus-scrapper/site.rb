class Site

  attr_accessor :name, :request, :result, :output

  def initialize site
    @name    = site.name
    @request = site.data.request
    @result  = site.data.result
  end

  def make_request from, to, date
    if @request.type == INTERPOLATE
      date = formatter date, @request.date_format
      url  = @request.url.sub(which_arg(@request.args, :from), from)
                    .sub(which_arg(@request.args, :to), to)
                    .sub(which_arg(@request.args, :date), date)
      @output = Curl::Easy.perform(url).body_str
    else
      params = {
        "#{@request.from}": from,
        "#{@request.to}": to,
        "#{@request.date}": formatter(date, @request.date_format)
      }
      @request.params.each do |param|
        params[param.name.to_sym] = resolver param.value
      end
      @output = Curl.send(@request.type, @request.url, params).body_str
    end
    self
  end

  def get_buses
    if @result.format == 'json'
      @output = JSON.parse @output
      buses = eval "#{@output}.#{@result.buses}"
      buses.map { |bus| Bus.new bus, @result }
    else
      # parse html content
    end
  end

  def to_json
    get_buses.map { |bus| bus.kind_of?(Bus) ? bus.to_json : {} }
  end
end
