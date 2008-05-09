require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + "/../lib/tinyurl_helper")

class TinyurlHelperTest < Test::Unit::TestCase
  include TinyurlHelper

  #dummy link_to
  def link_to(name, options = {}, html_options = nil)
    [name, html_options[:title]]
  end

  def test_link_to_tinyurl
    url = 'http://www.yahoo.co.jp/'
    tiny_url, title = link_to_tinyurl(url)
    assert_equal 'http://tinyurl.com/910', tiny_url
    assert_equal url, title
  end

  def test_link_to_tinyurl_with_title
    url = 'http://www.yahoo.co.jp/'
    tiny_url, title = link_to_tinyurl(url, {:title => 'title'})
    assert_equal 'http://tinyurl.com/910', tiny_url
    assert_equal 'title', title
  end
end
