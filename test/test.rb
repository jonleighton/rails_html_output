require File.join(File.dirname(File.dirname(__FILE__)), 'lib', 'rails_html_output')
require 'test/unit'

puts "Testing against Action Pack version #{ActionPack::VERSION::STRING}"

class HtmlOutputTest < Test::Unit::TestCase
  include ActionView::Helpers::TagHelper
  
  def test_tag
    assert_not_self_closing tag("br")
    assert_not_self_closing tag("link", :rel => "stylesheet")
    assert_not_self_closing tag("link", {:rel => "stylesheet"}, true)
    assert_not_self_closing tag("link", {:rel => "stylesheet"}, true, false)
  end
  
  def test_instance_tag
    assert_not_self_closing ActionView::Helpers::InstanceTag.new("test", "foo", self).to_input_field_tag("text")
  end
  
  private
  
  def assert_not_self_closing tag
    assert_nil tag["/"]
  end
end
