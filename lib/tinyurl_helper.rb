# TinyurlHelper
require 'net/http'

module TinyurlHelper
  def link_to_tinyurl(url, html_options = nil)
    uri = 'http://tinyurl.com/api-create.php?url=' + url
    uri = URI.parse(uri)
    tiny_url = Net::HTTP.get_response(uri).body
    options = {:title => url, :alt => url}
    options = html_options.nil? ? options : options.merge(html_options)
    link_to tiny_url, tiny_url, options
  end
end
