class UrlParser
  def initialize(url)
    @new_url = url

  end

  def scheme
    @scheme = @new_url.split(':').first
  end

  def domain
    @domain = @new_url.split('://').last.split(':').first
  end

  def port
     @port = @new_url.split(":").last.split("/").first
    if @port == "" && scheme == "http"
      "80"
    elsif @port == "" && scheme == "https"
      "443"
    else
      @port
    end
  end

  def path
    @path = @new_url.split("/").last.split("?").first
    @path == "" ? nil : @path
  end

  def query_string
    @query_string = @new_url.split('?').last.split('#').first.split('&')
    @query_string.map! do |item|
      item.split("=")
      end
    @query_string.to_h
  end

  def fragment_id
    @fragment_id = @new_url.split('#').last
  end

end

h =  UrlParser.new("http://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat")
p h.port
p h.domain
p h.path
p h.scheme
p h.query_string
p h.fragment_id