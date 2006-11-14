%w(rubygems action_pack test/unit).each { |r| require r }
require File.join(File.dirname(File.dirname(__FILE__)), 'lib', 'html_output')

class HtmlOutputTest < Test::Unit::TestCase
  include ActionView::Helpers::TagHelper
  
  def test_tag
    assert_not_self_closing tag("br")
  end
  
  def test_instance_tag
    assert_not_self_closing ActionView::Helpers::InstanceTag.new("test", "foo", self).to_input_field_tag("text")
  end
  
  private
  
  def assert_not_self_closing tag
    assert_nil tag["/"]
  end
end
