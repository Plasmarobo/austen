# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
HigginsCassidy::Application.initialize!

Mime::Type.register "text/ajax", :ajax
