
class UrlParser

  require 'uri'
  require 'uri/query_params'

  def initialize(url)
    @uri = URI(url)
  end

  def scheme
    @uri.scheme
  end

  def domain
    @uri.host
  end

  def port
     @uri.port.to_s
  end

  def path
    @uri.path.delete('/') == "" ? nil :  @uri.path.delete('/')
  end

  def query_string
    URI::QueryParams.parse(@uri.query)
  end

  def fragment_id
    @uri.fragment
  end

end

h = UrlParser.new "http://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat"
p h.scheme
p h.domain
p h.port
p h.path
p h.query_string
p h.fragment_id