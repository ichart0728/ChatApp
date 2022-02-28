# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# This will get rid of the filed with error setting that rails is currently adding to an input field which is set an validation error
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    html_tag.html_safe
end