# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Finpln::Application.initialize!

Date::DATE_FORMATS[:ru_datetime] = "%d.%m.%y"