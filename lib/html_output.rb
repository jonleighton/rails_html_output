require 'active_support'

module ActionView::Helpers::TagHelper
  
  # First copy the standard tag method to tag_old
  alias_method :tag_old, :tag
  
  # Calls tag_old making sure it will not self-close
  def non_self_closing_tag(name, options = nil, open = false)
    tag_old name, options, true
  end
  
  # Now calls to tag will be non-self-closing
  alias_method :tag, :non_self_closing_tag
  
end

class ActionView::Helpers::InstanceTag
  
  # We have to re-alias tag_without_error_wrapping because it is previously
  # aliased to the old version of tag, which self-closes
  alias_method :tag_without_error_wrapping, :non_self_closing_tag
  
end