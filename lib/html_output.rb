require 'active_support'

module ActionView::Helpers::TagHelper
  def tag(name, options = nil, open = false)
    options = options.stringify_keys.delete_if { |k, option| option.to_s.empty? }
    "<#{name}#{tag_options(options) if options}>"
  end
end